// ignore_for_file: await_only_futures, use_build_context_synchronously
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bellaryapp/constants/app_strings.dart';
import 'package:bellaryapp/constants/keys.dart';

import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/info_repository.dart';
import 'package:bellaryapp/services/api/api_helper.dart';

options(String prefix) {
  String url = '${AppStrings.apiUrl}$prefix';
  if (!url.endsWith('/')) url += '/';
  return BaseOptions(
      baseUrl: url,
      headers: setHeaders(),
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));
}

Map<String, String> setHeaders() {
  return {
    'AppCode': AppStrings.appName,
    'Accept': "application/json",
    'Authorization': "Bearer ${authProvider.accesstoken}",
  };
}

class APIService {
  final String prefixUrl;
  Dio dio = Dio();
  APIService({this.prefixUrl = ''}) {
    dio.options = options(prefixUrl);
    dio.interceptors.add(dioLogger);
  }

// post call
  Future<ResponseData> post(BuildContext context, String url,
      {body, params, bool isAuth = false}) async {
    while (true) {
      if (!await InfoRepository().checkInternetConnection()) {
        // Wait for a moment before retrying
        await Future.delayed(const Duration(seconds: 3));
        continue; // Continue the loop to check for internet connection again
      }
      try {
        if (AuthRepository().chekTokenExpired(isAuth: isAuth)) {
          await AuthRepository().refresh(context);
        }
        var response = await dio.post(url, data: body, queryParameters: params);
        return APIHelper().httpErrorHandle(response: response);
      } on DioException catch (e) {
        return APIHelper().httpErrorHandle(response: e.response);
      }
    }
  }

  //get call
  Future get(BuildContext context, String url,
      {body, params, bool isAuth = false}) async {
    while (true) {
      if (!await InfoRepository().checkInternetConnection()) {
        // Wait for a moment before retrying
        await Future.delayed(const Duration(seconds: 3));
        continue; // Continue the loop to check for internet connection again
      }
      try {
        var response = await dio.get(url, data: body, queryParameters: params);
        return APIHelper().httpErrorHandle(response: response);
      } on DioException catch (e) {
        return APIHelper().httpErrorHandle(response: e.response);
      }
    }
  }

  // put call
  Future put(BuildContext context, String url,
      {body, params, cusUrl, bool isAuth = false}) async {
    while (true) {
      if (!await InfoRepository().checkInternetConnection()) {
        // Wait for a moment before retrying
        await Future.delayed(const Duration(seconds: 3));
        continue; // Continue the loop to check for internet connection again
      }
      try {
        var response = await dio.put(url, data: body, queryParameters: params);
        return APIHelper().httpErrorHandle(response: response);
      } on DioException catch (e) {
        if (e.response == null) return;
        return APIHelper().httpErrorHandle(response: e.response);
      }
    }
  }

  //delete call
  Future delete(BuildContext context, String url,
      {body, params, bool isAuth = false}) async {
    while (true) {
      if (!await InfoRepository().checkInternetConnection()) {
        // Wait for a moment before retrying
        await Future.delayed(const Duration(seconds: 3));
        continue; // Continue the loop to check for internet connection again
      }
      try {
        var response =
            await dio.delete(url, data: body, queryParameters: params);
        return APIHelper().httpErrorHandle(response: response);
      } on DioException catch (e) {
        if (e.response == null) return;
        return APIHelper().httpErrorHandle(response: e.response);
      }
    }
  }
}
