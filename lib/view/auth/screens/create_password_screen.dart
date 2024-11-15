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
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  ///Declaring Controllers
  final contPassword = TextEditingController();
  final contConfirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthCreds get credentials => GoRouterState.of(context).extra as AuthCreds;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) => CustomScaffold(
        appBar: const AppBarCommon(title: 'Change Password'),
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(children: [
                const AuthHeading(
                    isStart: true,
                    title: 'Create New Password',
                    desc:
                        "Your New password must be different than the Previous passwords"),
                const HeightFull(multiplier: 3),
                TextFormFieldCustom(
                  controller: contPassword,
                  label: 'Password',
                  hint: 'Enter your password',
                  obscured: true,
                  prefix: const Icon(Icons.lock_outline),
                ),
                const HeightFull(),
                TextFormFieldCustom(
                  controller: contConfirmPassword,
                  label: 'Confirm Password',
                  hint: 'Re-Enter your password',
                  obscured: true,
                  validator: passwordValidator,
                  prefix: const Icon(Icons.lock_outline),
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

  String? passwordValidator(String? input) {
    if (contConfirmPassword.text != contPassword.text) {
      return "Passwords doesn't match";
    }
    return null;
  }

  void onSendOTP() {
    if (formKey.hasError) return;
    AuthCreds creds = credentials.copyWith(password: contConfirmPassword.text);
    AuthRepository().resetPassword(context, creds);
  }
}
