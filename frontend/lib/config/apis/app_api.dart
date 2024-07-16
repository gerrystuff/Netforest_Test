import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app/config/apis/app_http_manager.dart';

class AppApi {

  static final client = Modular.get<AppHttpManager>();

  static Future mobileGet(String path, {dynamic params}) async {
    try {
        final resp = await client.backMobile.get(path, queryParameters: params ?? {});

        return resp;
    } on DioException catch (e) {
      throw (e.response?.data['message'] ?? 'Error en el Get');
    }
  }

static Future mobilePost(String path, dynamic data) async {
  try {
    final resp = await client.backMobile.post(
      path,
      data: json.encode(data),
    );
    return resp;
  } on DioException catch (e) {
    throw (e.response?.data['message'] ?? 'Error en el Get');
  }
}
  
}