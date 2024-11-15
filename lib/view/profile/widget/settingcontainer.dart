import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/size_unit.dart';

class Settingcontainer extends StatefulWidget {
  const Settingcontainer({
    super.key,
  });

  @override
  State<Settingcontainer> createState() => _SettingcontainerState();
}

class _SettingcontainerState extends State<Settingcontainer> {
  final contFullname = TextEditingController();
  final contNickname = TextEditingController();
  final contDob = TextEditingController();
  final contEmail = TextEditingController();
  final contMobile = TextEditingController();

  String selectedgender = AppStrings.genderList[0];
  String? selectedCode = '+91';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(children: [
        //const HeightFull(),
        ClipRRect(
            borderRadius: ThemeGuide.borderRadius(),
            child: const Icon(
              Icons.account_circle,
              size: SizeUnit.xlg * 6,
              color: Color(0xffD9D9D9),
            )),
        //  const HeightFull(multiplier: 3),
        const HeightFull(),

        const HeightFull(),

        const HeightFull(),
      ]),
    );
  }

  void onEdit() {
    context.push(Routes.updateProfile);
  }
}
