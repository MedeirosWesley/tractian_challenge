import 'package:tractian_challenge/features/company/data/models/company_model.dart';

abstract class CompanyAdapter {
  static Company fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<Company> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json)).toList();
  }
}
