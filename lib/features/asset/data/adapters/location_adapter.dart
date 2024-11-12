import 'package:tractian_challenge/features/asset/data/models/location_model.dart';

abstract class LocationAdapter {
  static LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      parentId: json['parentId'],
    );
  }

  static List<LocationModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
}
