import 'package:bellaryapp/models/auth_creds.dart';
import 'package:bellaryapp/models/auth_user.dart';
import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/repositories/category_repository.dart';
import 'package:bellaryapp/repositories/city_repository.dart';
import 'package:bellaryapp/repositories/language_repository.dart';
import 'package:bellaryapp/repositories/service_repository.dart';
import 'package:bellaryapp/repositories/shop_repository.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/utilities/custom_date_time.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:bellaryapp/utilities/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../providers/providers.dart';
import '../services/api/api_services.dart';
import '../services/route/routes.dart';

class AuthRepository {
  ///Prefix Url for the Authentication.
  final String _prefixUrl = 'auth';

  ///Declare the [APIService] as [_api] with the [_prefixUrl] for the Authentication.
  APIService get _api => APIService(prefixUrl: _prefixUrl);

  Future<bool> register(context, AuthCreds creds) async {
    authProvider.isLoading = true;
    ResponseData responseBody = await _api.post(context, "register",
        isAuth: true, body: creds.toJson());
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    saveCreds(context, responseBody);
    // navigateHome(context);
    navigateCity(context);
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    return true;
  }


  Future<bool> login(context, AuthCreds creds) async {
    authProvider.isLoading = true;
    ResponseData responseBody =
        await _api.post(context, "login", isAuth: true, body: creds.toJson());
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    saveCreds(context, responseBody);
    // navigateCity(context);
    navigateHome(context);
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    return true;
  }

  Future<bool> refresh(context) async {
    authProvider.isLoading = true;
    ResponseData responseBody =
        await _api.get(context, "refresh", isAuth: true);
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    saveCreds(context, responseBody);
    return true;
  }

  Future<bool> logOut(context) async {
    ResponseData responseBody = await _api.get(context, "logout", isAuth: true);
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    clearCreds();
    navigateLogin(context);
    return true;
  }

  Future<bool> forgotPassword(context, AuthCreds creds) async {
    authProvider.isLoading = true;
    ResponseData responseBody = await _api.post(context, "forget-password",
        params: creds.toJson(), isAuth: true);
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    router.push(Routes.forgotPasswordOTP, extra: creds);
    return true;
  }

  Future<bool> resetPassword(context, AuthCreds creds) async {
    authProvider.isLoading = true;
    ResponseData responseBody = await _api.post(context, "reset-password",
        params: creds.toJson(), isAuth: true);
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    navigateLogin(context);
    return true;
  }

  Future<bool> validateOTP(context, AuthCreds creds) async {
    authProvider.isLoading = true;
    ResponseData responseBody = await _api.post(context, "verify-otp",
        params: creds.toJson(), isAuth: true);
    authProvider.isLoading = false;
    if (responseBody.hasError) return false;
    String message = responseBody.data['message'] ?? '';
    if (message.isNotEmpty) showMessage(message);
    router.push(Routes.createPassword, extra: creds);
    return true;
  }

  bool chekTokenExpired({required bool isAuth}) {
    if (authProvider.loggedAt == null) return false;
    DateTime currentTime = CustomDateTime().now;
    return authProvider.loggedAt!.difference(currentTime).inMinutes < 5 &&
        authProvider.accesstoken.isNotEmpty &&
        !isAuth;
  }

  void saveCreds(BuildContext context, ResponseData responseData) {
    AuthUser user = AuthUser.fromJson(responseData.data['user'] ?? {});
    authProvider.user = user;
    int expiresAt = responseData.data['expires_in'] ?? 0;
    if (expiresAt != 0) {
      authProvider.loggedAt =
          DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);
    }
    authProvider.accesstoken = responseData.data['access_token'] ?? '';
    initializeAPI(context);
  }

  void initializeAPI(BuildContext context) {
    if (cityProvider.cities.isEmpty) CityRepository().getCities(context);
    if (languageProvider.languages.isEmpty) {
      LanguageRepository().getLanguages(context);
    }
    CategoryRepository().getProductCategories(context);
    CategoryRepository().getServiceCategories(context);
    ShopRepository().getShops(context);
    ServiceRepository().getMostBookedServices(context);
  }

  void clearCreds() {
    authProvider.user = null;
    authProvider.accesstoken = '';
  }

  void navigateHome(BuildContext context) {
    isLoggedIn = true;
    isOnBoarded = true;
    context.go(Routes.home);
  }

  void navigateOnboard(BuildContext context) {
    context.go(Routes.welcome);
  }

  void navigateCity(BuildContext context) {
    isLoggedIn = true;
    isOnBoarded = true;
    context.go(Routes.city, extra: false);
  }

  void navigateLogin(BuildContext context) {
    isLoggedIn = false;
    isOnBoarded = true;
    context.go(Routes.login);
  }

  Future<User?> getGoogleCreds(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        return null;
      }
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      GoogleSignIn().signOut();
      return user.user;
    } on Exception {
      return null;
    }
  }
}
