import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/models/profile.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:dio/dio.dart';

import '../models/response.dart';
import '../providers/providers.dart';
import '../utilities/message.dart';

class ProfileRepository {
  final APIService _api = APIService();

  Future<bool> getUser(context, Profile profile) async {
    profileProvider.isLoading = true;
    ResponseData responseBody = await _api.get(context, "register",
        isAuth: true, body: profile.toJson());

    profileProvider.isLoading = false;
    if (responseBody.hasError) return false;

    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    return true;
  }

  Future<bool> editProfile(context, Profile profile) async {
    profileProvider.isLoading = true;
    logger.e(profile.toJson());
    ResponseData responseBody = await _api.post(context, "profile/update",
        isAuth: true, body: FormData.fromMap(profile.toJson()));
    profileProvider.isLoading = false;
    if (responseBody.hasError) return false;
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    return true;
  }
}
