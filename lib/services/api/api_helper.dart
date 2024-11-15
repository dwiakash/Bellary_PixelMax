import 'package:dio/dio.dart';
import 'package:bellaryapp/constants/keys.dart';

import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/services/storage/storage_constants.dart';
import 'package:bellaryapp/utilities/message.dart';

class APIHelper {
  ResponseData httpErrorHandle({required Response? response}) {
    Map<String, dynamic> data =
        response?.data is String ? {} : response?.data ?? {};
    int statusCode = response?.statusCode ?? 500;
    String message = data['messasge'] ?? '';
    if (statusCode == 500) showMessage('Server or Database not running');
    if (message.isNotEmpty && statusCode == 400) {
      showMessage(message, duration: const Duration(seconds: 3));
    }
    if (statusCode == 401) {
      handleUnauthorized();
    }
    ResponseData responseData =
        ResponseData(data: data, statusCode: statusCode);
    return responseData;
  }

  Future<void> handleUnauthorized() async {
    return storage.delete(key: StorageConstants.accessToken).then((value) {
      router.go(Routes.login);
    });
  }
}
