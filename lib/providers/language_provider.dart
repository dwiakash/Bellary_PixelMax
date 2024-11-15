import 'package:bellaryapp/models/lanugage.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isGettingLanguages = false;
  bool get isGettingLanguages => _isGettingLanguages;
  set isGettingLanguages(bool val) {
    _isGettingLanguages = val;
    notifyListeners();
  }

  List<Language> _languages = [];
  List<Language> get languages => _languages;
  set languages(List<Language> languages) {
    _languages = languages;
    notifyListeners();
  }
}
