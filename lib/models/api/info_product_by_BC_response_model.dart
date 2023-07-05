import 'data.dart';

class InfoProductByBCResponseModel {
  bool success;
  Data? data;

  InfoProductByBCResponseModel({required this.success, this.data});

  factory InfoProductByBCResponseModel.fromJson(Map<String, dynamic> json) {
    return InfoProductByBCResponseModel(
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }
}
