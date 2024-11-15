import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/app_strings.dart';
import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/theme/Palette.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottomBar: Padding(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: ButtonPrimary(
            onPressed: () => onTap(context), label: 'Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeightFull(),
            Image.asset(
              'assets/onboard/introduction.png', // Ensure this image exists
              width: context.widthFull(),
              height: context.widthHalf(),
            ),
            const HeightFull(),
            const TextCustom(
              'Welcome to ${AppStrings.appName}!',
              color: Palette.primarytext,
              size: 24,
              fontWeight: FontWeight.w900,
            ),
            const HeightFull(),
            const HeightHalf(),
            const TextCustom(
              'Discover a seamless shopping experience tailored to your needs. Whether you are looking for groceries, local shop products, or various services, we have got you covered.',
              size: 14,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    // isOnBoarded = true;
    context.push(Routes.onboard);
  }
}
