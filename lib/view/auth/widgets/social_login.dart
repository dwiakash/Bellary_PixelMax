import 'package:bellaryapp/constants/assets/local_icons.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/auth_creds.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;

import '../../../repositories/auth_repository.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: SizeUnit.sm),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(),
          IconButton(
              onPressed: onFacebookLogin,
              icon: Image.asset(LocalIcons.facebook, height: 45, width: 45)),
          IconButton(
              onPressed: () => onGoogleLogin(context),
              icon: Image.asset(LocalIcons.google, height: 45, width: 45)),
          const SizedBox(),
        ]));
  }

  void onGoogleLogin(context) async {
    fbauth.User? user = await AuthRepository().getGoogleCreds(context);
    if (user == null) return;
    AuthCreds params = AuthCreds(
      email: user.email ?? '',
      isGoogleLogin: true,
    );
    AuthRepository().login(context, params as AuthCreds);
  }

  void onFacebookLogin() {}
}
