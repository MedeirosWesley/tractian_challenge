import 'package:tractian_challenge/features/asset/data/models/node.dart';

class NodeTree {
  final Node node;
  final List<NodeTree> children;

  NodeTree({required this.node, required this.children});
}
