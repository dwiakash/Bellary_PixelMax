import 'package:bellaryapp/models/lanugage.dart';
import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:bellaryapp/utilities/message.dart';
import 'package:flutter/material.dart';

class LanguageRepository {
  final APIService _api = APIService();

  Future<bool> getLanguages(BuildContext context) async {
    languageProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, 'language');
    languageProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Language> languages =
        Language().fromJsonList(responseData.data['data'] ?? []);
    languageProvider.languages = languages;
    return true;
  }

  Future<bool> updateLanguage(BuildContext context, Language language) async {
    languageProvider.isLoading = true;
    ResponseData responseData = await _api
        .post(context, 'profile/update-language', params: language.toJson());
    languageProvider.isLoading = false;
    if (responseData.hasError) return false;
    String message = responseData.data['message'] ?? '';
    showMessage(message);
    return true;
  }
}
