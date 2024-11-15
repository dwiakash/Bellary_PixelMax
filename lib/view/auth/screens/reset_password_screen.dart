import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:bellaryapp/view/auth/widgets/auth_heading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ///Declaring Controllers
  final contEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(title: 'Change Password'),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Column(children: [
              const AuthHeading(
                  isStart: true,
                  title: 'Reset Password',
                  desc:
                      "Enter your email to receive a link to reset your password. Make sure it’s the one you used to sign up"),
              const HeightFull(multiplier: 3),
              TextFormFieldCustom(
                controller: contEmail,
                label: 'Email',
                hint: 'Enter your email',
                prefix: const Icon(Icons.mail_outline),
              ),
              const HeightHalf(),
              const HeightFull(),
              Row(children: [
                Expanded(
                    child:
                        ButtonPrimary(onPressed: onSendOTP, label: 'Send OTP')),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  void onSendOTP() {
    if (formKey.hasError) return;
    context.push(Routes.createPassword);
  }
}
