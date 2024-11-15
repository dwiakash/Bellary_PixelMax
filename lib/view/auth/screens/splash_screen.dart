import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/app_strings.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/services/route/router.dart';
import 'package:bellaryapp/services/storage/storage_constants.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => initilize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.primary,
      body: Center(
        child: TextCustom(
          AppStrings.appName,
          color: Palette.pureWhite,
          size: 26,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  void initilize() async {
    isInitialized = true;
    //remove cmt after onbo
    String token = await storage.read(key: StorageConstants.accessToken) ?? '';
    authProvider.accesstoken = token;

    if (token.isNotEmpty) {
      bool isRefresh = await AuthRepository().refresh(context);
      if (isRefresh) {
        AuthRepository().navigateHome(context);
        return;
      }
    }
    AuthRepository().navigateOnboard(context);

    //  context.go(Routes.login);
  }
}
