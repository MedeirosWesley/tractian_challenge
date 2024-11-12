// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetStore on AssetStoreBase, Store {
  Computed<ObservableList<Node>>? _$nodesComputed;

  @override
  ObservableList<Node> get nodes =>
      (_$nodesComputed ??= Computed<ObservableList<Node>>(() => super.nodes,
              name: 'AssetStoreBase.nodes'))
          .value;

  late final _$selectedSensorTypeAtom =
      Atom(name: 'AssetStoreBase.selectedSensorType', context: context);

  @override
  SensorType? get selectedSensorType {
    _$selectedSensorTypeAtom.reportRead();
    return super.selectedSensorType;
  }

  @override
  set selectedSensorType(SensorType? value) {
    _$selectedSensorTypeAtom.reportWrite(value, super.selectedSensorType, () {
      super.selectedSensorType = value;
    });
  }

  late final _$isStatusCriticalAtom =
      Atom(name: 'AssetStoreBase.isStatusCritical', context: context);

  @override
  bool get isStatusCritical {
    _$isStatusCriticalAtom.reportRead();
    return super.isStatusCritical;
  }

  @override
  set isStatusCritical(bool value) {
    _$isStatusCriticalAtom.reportWrite(value, super.isStatusCritical, () {
      super.isStatusCritical = value;
    });
  }

  late final _$filterTextAtom =
      Atom(name: 'AssetStoreBase.filterText', context: context);

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
    });
  }

  late final _$stateAtom = Atom(name: 'AssetStoreBase.state', context: context);

  @override
  AppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$assetsAtom =
      Atom(name: 'AssetStoreBase.assets', context: context);

  @override
  ObservableList<Node> get assets {
    _$assetsAtom.reportRead();
    return super.assets;
  }

  @override
  set assets(ObservableList<Node> value) {
    _$assetsAtom.reportWrite(value, super.assets, () {
      super.assets = value;
    });
  }

  late final _$locationsAtom =
      Atom(name: 'AssetStoreBase.locations', context: context);

  @override
  ObservableList<Node> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(ObservableList<Node> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  late final _$nodeTreesAtom =
      Atom(name: 'AssetStoreBase.nodeTrees', context: context);

  @override
  ObservableList<NodeTree> get nodeTrees {
    _$nodeTreesAtom.reportRead();
    return super.nodeTrees;
  }

  @override
  set nodeTrees(ObservableList<NodeTree> value) {
    _$nodeTreesAtom.reportWrite(value, super.nodeTrees, () {
      super.nodeTrees = value;
    });
  }

  late final _$filteredNodeTreesAtom =
      Atom(name: 'AssetStoreBase.filteredNodeTrees', context: context);

  @override
  ObservableList<NodeTree> get filteredNodeTrees {
    _$filteredNodeTreesAtom.reportRead();
    return super.filteredNodeTrees;
  }

  @override
  set filteredNodeTrees(ObservableList<NodeTree> value) {
    _$filteredNodeTreesAtom.reportWrite(value, super.filteredNodeTrees, () {
      super.filteredNodeTrees = value;
    });
  }

  late final _$buildNodeTreesAsyncAction =
      AsyncAction('AssetStoreBase.buildNodeTrees', context: context);

  @override
  Future<void> buildNodeTrees() {
    return _$buildNodeTreesAsyncAction.run(() => super.buildNodeTrees());
  }

  late final _$getAssetsByCompanyIdAsyncAction =
      AsyncAction('AssetStoreBase.getAssetsByCompanyId', context: context);

  @override
  Future<void> getAssetsByCompanyId() {
    return _$getAssetsByCompanyIdAsyncAction
        .run(() => super.getAssetsByCompanyId());
  }

  late final _$getLocationsByCompanyIdAsyncAction =
      AsyncAction('AssetStoreBase.getLocationsByCompanyId', context: context);

  @override
  Future<void> getLocationsByCompanyId() {
    return _$getLocationsByCompanyIdAsyncAction
        .run(() => super.getLocationsByCompanyId());
  }

  late final _$AssetStoreBaseActionController =
      ActionController(name: 'AssetStoreBase', context: context);

  @override
  void setCriticalStatus(bool status) {
    final _$actionInfo = _$AssetStoreBaseActionController.startAction(
        name: 'AssetStoreBase.setCriticalStatus');
    try {
      return super.setCriticalStatus(status);
    } finally {
      _$AssetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedSensorType(SensorType? sensorType) {
    final _$actionInfo = _$AssetStoreBaseActionController.startAction(
        name: 'AssetStoreBase.setSelectedSensorType');
    try {
      return super.setSelectedSensorType(sensorType);
    } finally {
      _$AssetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByText(String text) {
    final _$actionInfo = _$AssetStoreBaseActionController.startAction(
        name: 'AssetStoreBase.filterByText');
    try {
      return super.filterByText(text);
    } finally {
      _$AssetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterNodeTrees() {
    final _$actionInfo = _$AssetStoreBaseActionController.startAction(
        name: 'AssetStoreBase.filterNodeTrees');
    try {
      return super.filterNodeTrees();
    } finally {
      _$AssetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSensorType: ${selectedSensorType},
isStatusCritical: ${isStatusCritical},
filterText: ${filterText},
state: ${state},
assets: ${assets},
locations: ${locations},
nodeTrees: ${nodeTrees},
filteredNodeTrees: ${filteredNodeTrees},
nodes: ${nodes}
    ''';
  }
}
