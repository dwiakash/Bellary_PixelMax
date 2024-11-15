import 'package:bellaryapp/utilities/extensions/map_extention.dart';

class AuthCreds {
  String? email;
  String? name;
  String? password;
  String? otp;
  bool? isGoogleLogin;
  AuthCreds(
      {this.email, this.name, this.otp, this.password, this.isGoogleLogin});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data.addAllIf(name != null, {"name": name});
    data.addAllIf(email != null, {"email": email});
    data.addAllIf(password != null, {"password": password});
    data.addAllIf(otp != null, {"otp": otp});
    data.addAllIf(otp != null, {"is_google": isGoogleLogin});
    return data;
  }

  AuthCreds copyWith({
    String? email,
    String? password,
    String? otp,
    String? name,
    bool? isGoogleLogin,
  }) {
    return AuthCreds(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        otp: otp ?? this.otp,
        isGoogleLogin: isGoogleLogin ?? this.isGoogleLogin);
  }
}
