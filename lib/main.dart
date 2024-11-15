import 'package:bellaryapp/providers/info_provider.dart';
import 'package:bellaryapp/view/no_internet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/constants/app_strings.dart';
import '/providers/providers.dart';
import 'package:provider/provider.dart';
import '/utilities/custom_date_time.dart';
import 'constants/keys.dart';
import 'firebase_options.dart';
import 'services/route/router.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(MultiProvider(providers: providers, child: const MyApp())));
  CustomDateTime().getOffSet();
  // runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeManager, InfoProvider>(
      builder: (context, themeManager, info, child) {
        return MaterialApp.router(
          key: mainKey,
          builder: (BuildContext context, Widget? child) => Stack(children: [
            if (child != null) child,
            if (!info.isHadInternet) const NoInternetScreen(),
          ]),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: lightTheme,
          // darkTheme: darkTheme,
          themeMode: themeManager.themeMode,
          routerConfig: router,
          scaffoldMessengerKey: snackbarKey,
        );
      },
    );
  }
}