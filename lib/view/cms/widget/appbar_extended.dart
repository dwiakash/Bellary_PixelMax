import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/text.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/size_unit.dart';
import '../../../theme/palette.dart';

class Appbarcontainer extends StatelessWidget {
  const Appbarcontainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      color: Palette.primary,
      width: context.widthFull(),
      height: context.heightQuarter() / 1.7,
      child: Container(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextCustom(
              AppStrings.appName,
              size: 36.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
