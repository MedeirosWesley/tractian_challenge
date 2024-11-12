import 'package:tractian_challenge/features/asset/data/enums/component_status.dart';
import 'package:tractian_challenge/features/asset/data/enums/sensor_type.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

class ComponentModel extends Node {
  final String sensorId;
  final SensorType? sensorType;
  final ComponentStatus? status;
  final String gatewayId;

  ComponentModel(
      {required super.id,
      required super.name,
      required super.parentId,
      required this.sensorId,
      required this.sensorType,
      required this.status,
      required this.gatewayId});
}
