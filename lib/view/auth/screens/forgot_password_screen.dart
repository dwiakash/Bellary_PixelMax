import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/auth_creds.dart';
import 'package:bellaryapp/providers/auth_provider.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:bellaryapp/view/auth/widgets/auth_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ///Declaring Controllers
  final contEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(),
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) => Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(children: [
                const AuthHeading(
                    title: 'Forgot Password?',
                    desc: "Let's Recover your Password"),
                const HeightFull(multiplier: 3),
                TextFormFieldCustom(
                  controller: contEmail,
                  label: 'Email',
                  hint: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.mail_outline),
                ),
                const HeightHalf(),
                const HeightFull(),
                Row(children: [
                  Expanded(
                      child: ButtonPrimary(
                          onPressed: onSendOTP,
                          isLoading: auth.isLoading,
                          label: 'Send OTP')),
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void onSendOTP() {
    if (formKey.hasError) return;
    AuthCreds creds = AuthCreds(email: contEmail.text.trim());
    AuthRepository().forgotPassword(context, creds);
  }
}
