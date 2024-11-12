import 'package:tractian_challenge/features/asset/data/enums/component_status.dart';
import 'package:tractian_challenge/features/asset/data/enums/sensor_type.dart';
import 'package:tractian_challenge/features/asset/data/models/asset_model.dart';
import 'package:tractian_challenge/features/asset/data/models/component_model.dart';
import 'package:tractian_challenge/features/asset/data/models/node.dart';

abstract class AssetAdapter {
  static Node fromJson(Map<String, dynamic> json) {
    if (json['sensorType'] == null) {
      return AssetModel(
        id: json['id'],
        name: json['name'],
        parentId: json['parentId'] ?? json['locationId'],
      );
    } else {
      return ComponentModel(
        id: json['id'],
        name: json['name'],
        parentId: json['parentId'] ?? json['locationId'],
        sensorId: json['sensorId'],
        sensorType: SensorType.fromString(json['sensorType']),
        status: ComponentStatus.fromString(json['status']),
        gatewayId: json['gatewayId'],
      );
    }
  }

  static List<Node> fromJsonList(List<dynamic> json) {
    return json.map((e) => fromJson(e)).toList();
  }
}
