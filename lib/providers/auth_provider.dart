import 'package:flutter/material.dart';
import '/constants/keys.dart';
import '/models/auth_user.dart';
import '/services/storage/storage_constants.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  DateTime? _loggedAt;
  DateTime? get loggedAt => _loggedAt;
  set loggedAt(DateTime? date) {
    _loggedAt = date;
    notifyListeners();
  }

  String _accesstoken = "";
  String get accesstoken => _accesstoken;
  set accesstoken(String newToken) {
    _accesstoken = newToken;
    storage.write(key: StorageConstants.accessToken, value: _accesstoken);
    notifyListeners();
  }

  bool _googleLoading = false;
  bool get googleLoading => _googleLoading;
  set googleLoading(bool val) {
    _googleLoading = val;
    notifyListeners();
  }

  AuthUser? _user;
  AuthUser? get user => _user;
  set user(AuthUser? val) {
    _user = val;
    notifyListeners();
  }
}
