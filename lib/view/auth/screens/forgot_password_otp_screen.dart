import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/auth_creds.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:bellaryapp/view/auth/widgets/auth_heading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  State<ForgotPasswordOTPScreen> createState() =>
      _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
  ///Declaring Controllers
  final contOTP = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthCreds get credentials => GoRouterState.of(context).extra as AuthCreds;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Column(children: [
              const AuthHeading(
                  title: 'Forgot Password?',
                  desc: "Let's Recover your Password"),
              const HeightFull(),
              const TextCustom('Enter the 4 digit OTP sent to your email'),
              const HeightFull(),
              OtpField(
                controller: contOTP,
                onCompleted: (e) => onVerify(),
              ),
              const HeightHalf(),
              const HeightFull(),
              Row(children: [
                Expanded(
                    child: ButtonPrimary(onPressed: onVerify, label: 'Verify')),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  void onVerify() {
    if (_formKey.hasError) return;
    AuthCreds creds = credentials.copyWith(otp: contOTP.text);
    AuthRepository().validateOTP(context, creds);
    // context.push(Routes.resetPassword);
    // AuthRepository().resetpassword(context, email,otp,newpassword)
  }
}
