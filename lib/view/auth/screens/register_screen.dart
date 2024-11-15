import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/auth_creds.dart';
import 'package:bellaryapp/providers/auth_provider.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:bellaryapp/view/auth/widgets/auth_heading.dart';
import 'package:bellaryapp/view/auth/widgets/auth_rich_text.dart';
import 'package:bellaryapp/view/auth/widgets/continue_widget.dart';
import 'package:bellaryapp/view/auth/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ///Declaring Controllers
  final contName = TextEditingController();
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
                    title: 'Create Account', desc: 'Register a Account'),
                const HeightFull(multiplier: 3),
                TextFormFieldCustom(
                  controller: contName,
                  label: 'Name',
                  hint: 'Enter your name',
                  prefix: const Icon(Icons.person_outline),
                ),
                const HeightFull(),
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
                          onPressed: onSignUp,
                          isLoading: auth.isLoading,
                          label: 'Sign Up')),
                ]),
                const HeightFull(),
                const HeightHalf(),
                //  const ContinueWidget(),
                //const SocialLogin(),
                AuthRichText(
                    text1: "Already have an account?",
                    text2: 'Sign In',
                    onPressed: onSignIn),
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
    context.go(Routes.login);
  }

  void onSignUp() {
    if (formKey.hasError) return;
    AuthCreds creds = AuthCreds(
        name: contName.text.trim(),
        email: contEmail.text.trim(),
        password: contPassword.text.trim());
    AuthRepository().register(context, creds);
  }
}
