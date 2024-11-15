import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/size_unit.dart';
import '../../../constants/space.dart';
import '../../../services/route/routes.dart';
import '../../../theme/theme_guide.dart';

class Setupprofile extends StatefulWidget {
  const Setupprofile({super.key});

  @override
  State<Setupprofile> createState() => _SetupprofileState();
}

class _SetupprofileState extends State<Setupprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        // alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SizeUnit.lg),
          child: Column(children: [
            ClipRRect(
                borderRadius: ThemeGuide.borderRadius(),
                child: const Icon(
                  Icons.account_circle,
                  size: SizeUnit.xlg * 8,
                  color: Color(0xffD9D9D9),
                )),
            const HeightHalf(),
            const HeightFull(),
            Row(children: [
              Expanded(
                  child: ButtonPrimary(
                      label: 'Complete your profile', onPressed: oncomplete)),
            ]),
            const HeightFull(),
            Row(children: [
              Expanded(
                  child: ButtonOutlined(
                label: "I’ll do it later",
                onPressed: () {
                  onlater();
                },
              )),
            ]),
            const HeightHalf(),
          ]),
        ),
      ),
    );
  }

  void oncomplete() {
    context.go(Routes.home);
    context.push(Routes.updateProfile);
  }

  void onlater() {
    context.go(Routes.home);
  }
}
