import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/auth_creds.dart';
import 'package:bellaryapp/providers/auth_provider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:bellaryapp/view/auth/widgets/auth_heading.dart';
import 'package:bellaryapp/view/auth/widgets/auth_rich_text.dart';
import 'package:bellaryapp/view/auth/widgets/continue_widget.dart';
import 'package:bellaryapp/view/auth/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  ///Declaring Controllers
  final contEmail = TextEditingController();
  final contPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) => Form(
          key: formKey,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(children: [
                const AuthHeading(
                    title: 'Welcome Back,', desc: 'Login to your Account'),
                const HeightFull(multiplier: 3),
                TextFormFieldCustom(
                  controller: contEmail,
                  label: 'Email',
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.mail_outline),
                ),
                const HeightFull(),
                TextFormFieldCustom(
                  controller: contPassword,
                  label: 'Password',
                  hint: 'Enter your password',
                  obscured: true,
                  prefix: const Icon(Icons.lock_outline),
                ),
                const HeightHalf(),
                const HeightFull(),
                Row(children: [
                  Expanded(
                      child: ButtonPrimary(
                          onPressed: onSignIn,
                          isLoading: auth.isLoading,
                          label: 'Sign In')),
                ]),
                const HeightHalf(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: onForgotPassword,
                      child: const TextCustom('Forgot Password?')),
                ),
                //  const ContinueWidget(),
                //  const SocialLogin(),
                AuthRichText(
                    text1: "Don't have an account?",
                    text2: 'Sign Up',
                    onPressed: onSignUp),
                const HeightFull(),
                const HeightHalf(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void onSignIn() {
    if (formKey.hasError) return;
    AuthCreds creds = AuthCreds(
        email: contEmail.text.trim(), password: contPassword.text.trim());
    AuthRepository().login(context, creds);
  }

  void onSignUp() {
    context.push(Routes.register);
  }

  void onForgotPassword() {
    context.push(Routes.forgotPassword);
  }
}
