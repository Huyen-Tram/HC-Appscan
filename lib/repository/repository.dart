// import 'dart:io';
import 'package:dio/dio.dart';

import '../models/api/info_product_by_BC_response_model.dart';
class Repository {
  final _dio = Dio();

  Future<InfoProductByBCResponseModel?> getInfoProductByBC(String barCode) async {
    try {
      var url = "http://192.168.54.72:9594/Product/GetInfoProductByBC_V3?PBarData=$barCode";

      var response = await _dio.get(url);
      if (response.statusCode == 200) {

        var result=response.data;
        // result.pAvatar == "https:"+ result.pAvatar;
        
        return InfoProductByBCResponseModel.fromJson(result);
      } 

    } catch(e) {
      print(e);
    }
    return null;
  }

}