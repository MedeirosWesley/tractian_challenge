import 'dart:developer';
import 'dart:isolate';

import 'package:mobx/mobx.dart';
import 'package:tractian_challenge/core/states/app_sate.dart';
import 'package:tractian_challenge/features/asset/data/enums/component_status.dart';
import 'package:tractian_challenge/features/asset/data/enums/sensor_type.dart';
import 'package:tractian_challenge/features/asset/data/models/component_model.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';
import 'package:tractian_challenge/features/asset/data/models/node_tree.dart';
import 'package:tractian_challenge/features/asset/domain/use_cases/asset_use_case.dart';
import 'package:tractian_challenge/features/asset/domain/use_cases/location_use_case.dart';

part 'asset_store.g.dart';

class AssetStore = AssetStoreBase with _$AssetStore;

abstract class AssetStoreBase with Store {
  final IAssetUseCase _assetUseCase;
  final ILocaationUserCase _locationUseCase;
  final String companyId;

  AssetStoreBase(
      {required this.companyId,
      required IAssetUseCase assetUseCase,
      required ILocaationUserCase locationUseCase})
      : _assetUseCase = assetUseCase,
        _locationUseCase = locationUseCase;

  getResources() async {
    state = LoadingState();
    try {
      await Future.wait([getAssetsByCompanyId(), getLocationsByCompanyId()]);
      await buildNodeTrees();
      state = LoadedState();
    } catch (e) {
      state = ErrorState(message: e.toString());
    }
  }

  @observable
  SensorType? selectedSensorType;

  @observable
  bool isStatusCritical = false;

  @observable
  String filterText = '';

  @observable
  AppState state = IdleState();

  @observable
  ObservableList<Node> assets = ObservableList<Node>.of([]);

  @observable
  ObservableList<Node> locations = ObservableList<Node>.of([]);

  @observable
  ObservableList<NodeTree> nodeTrees = ObservableList<NodeTree>.of([]);

  @observable
  ObservableList<NodeTree> filteredNodeTrees = ObservableList<NodeTree>.of([]);

  @computed
  ObservableList<Node> get nodes =>
      ObservableList<Node>.of([...locations, ...assets]);

  @action
  Future<void> buildNodeTrees() async {
    final receivePort = ReceivePort();

    try {
      await Isolate.spawn(
          _buildNodeTreesInIsolate, [nodes, receivePort.sendPort]);

      final List<NodeTree> result = await receivePort.first;
      nodeTrees = ObservableList<NodeTree>.of(result);
      filteredNodeTrees = ObservableList<NodeTree>.of(result);
    } catch (e) {
      log("Isolate error ->: $e");
    } finally {
      receivePort.close();
    }
  }

  @action
  Future<void> getAssetsByCompanyId() async {
    assets = ObservableList<Node>.of(
        await _assetUseCase.getAssetsByCompanyId(companyId));
  }

  @action
  Future<void> getLocationsByCompanyId() async {
    locations = ObservableList<Node>.of(
        await _locationUseCase.getLocationsByCompanyId(companyId));
  }

  @action
  void setCriticalStatus(bool status) {
    isStatusCritical = status;
    filterNodeTrees();
  }

  @action
  void setSelectedSensorType(SensorType? sensorType) {
    selectedSensorType = sensorType;
    filterNodeTrees();
  }

  @action
  void filterByText(String text) {
    filterText = text;
    filterNodeTrees();
  }

  @action
  void filterNodeTrees() {
    if (selectedSensorType == null && filterText.isEmpty && !isStatusCritical) {
      filteredNodeTrees = ObservableList<NodeTree>.of(nodeTrees);
      return;
    }

    filteredNodeTrees = ObservableList<NodeTree>.of(
      nodeTrees.map((nodeTree) => filterTree(nodeTree)).whereType<NodeTree>(),
    );
  }

  NodeTree? filterTree(NodeTree nodeTree) {
    if (nodeTree.node is ComponentModel) {
      var component = nodeTree.node as ComponentModel;

      bool matchesSensor = selectedSensorType == null ||
          component.sensorType == selectedSensorType;
      bool matchesName = filterText.isEmpty ||
          component.name.toLowerCase().contains(filterText.toLowerCase());
      bool matchesStatus =
          !isStatusCritical || (component.status == ComponentStatus.alert);

      if (matchesSensor && matchesName && matchesStatus) {
        return nodeTree;
      }
    }

    var filteredChildren = nodeTree.children
        .map((child) => filterTree(child))
        .whereType<NodeTree>()
        .toList();

    if (filteredChildren.isNotEmpty) {
      return NodeTree(node: nodeTree.node, children: filteredChildren);
    }

    return null;
  }
}

void _buildNodeTreesInIsolate(List<dynamic> args) {
  List<Node> nodes = args[0] as List<Node>;
  SendPort sendPort = args[1] as SendPort;

  final List<Node> roots =
      nodes.where((node) => node.parentId == null).toList();
  final List<NodeTree> subTree =
      roots.map((root) => _buildSubTree(root, nodes)).toList();

  sendPort.send(subTree);
}

NodeTree _buildSubTree(Node node, List<Node> nodes) {
  List<NodeTree> children = nodes
      .where((n) => n.parentId == node.id)
      .map((n) => _buildSubTree(n, nodes))
      .toList();

  return NodeTree(node: node, children: children);
}
