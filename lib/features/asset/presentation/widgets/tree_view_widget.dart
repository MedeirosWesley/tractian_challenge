import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/asset/data/models/asset_model.dart';
import 'package:tractian_challenge/features/asset/data/models/component_model.dart';
import 'package:tractian_challenge/features/asset/data/models/location_model.dart';
import 'package:tractian_challenge/features/asset/data/models/node_tree.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/asset_card_widget.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/component_card_widget.dart';
import 'package:tractian_challenge/features/asset/presentation/widgets/location_card_widget.dart';

class TreeViewWidget extends StatelessWidget {
  final List<NodeTree> nodes;
  final int level;
  const TreeViewWidget({super.key, required this.nodes, required this.level});

  @override
  Widget build(BuildContext context) {
    const double padding = 16.0;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        final nodeTree = nodes[index];

        return Stack(
          children: [
            if (level > 0)
              Positioned(
                left: padding + 8,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
            Padding(
              padding: level < 1
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(left: padding),
              child: _buildNode(nodeTree, level),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNode(NodeTree nodeTree, int level) {
    if (nodeTree.node is AssetModel) {
      final asset = nodeTree.node as AssetModel;
      return AssetCardWidget(
        isExpanded: false,
        asset: asset,
        children: nodeTree.children.isEmpty
            ? null
            : [
                TreeViewWidget(nodes: nodeTree.children, level: level + 1),
              ],
      );
    } else if (nodeTree.node is LocationModel) {
      final location = nodeTree.node as LocationModel;
      return LocationCardWidget(
        location: location,
        isExpanded: false,
        children: nodeTree.children.isEmpty
            ? null
            : [
                TreeViewWidget(nodes: nodeTree.children, level: level + 1),
              ],
      );
    } else if (nodeTree.node is ComponentModel) {
      final component = nodeTree.node as ComponentModel;
      if (level > 0) {
        return Stack(
          children: [
            Positioned(
                top: 27,
                left: 8,
                child: Container(height: 1.0, width: 8, color: Colors.grey)),
            ComponentCardWidget(
              component: component,
            ),
          ],
        );
      }
      return ComponentCardWidget(
        component: component,
      );
    }
    return Container();
  }
}
