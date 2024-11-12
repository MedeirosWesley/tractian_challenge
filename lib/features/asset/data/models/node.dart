abstract class Node {
  final String id;
  final String name;
  final String? parentId;

  Node({required this.id, required this.name, required this.parentId});
}
