// OnBoarding area widget

import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../common/widgets/text.dart';
import '../../../models/on_board.dart';
import '../../../theme/palette.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.data,
    required this.pageIndex,
  });
  final int pageIndex;
  final OnBoard data;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Palette.pureWhite,
          child: Column(children: [
            Image.asset(data.image,
                width: context.widthFull(), fit: BoxFit.fill),

            // const HeightFull(
            //   multiplier: 3,
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: Column(children: [
                  const Spacer(),
                  TextCustom(
                    data.title,
                    align: TextAlign.center,
                    size: 18,
                    fontWeight: FontWeight.w900,
                    color: Palette.primarytext,
                  ),
                  // const Spacer(),

                  const HeightFull(),
                  TextCustom(
                    data.desc1,
                    align: TextAlign.center,
                    size: 14,
                    color: Palette.dark,
                  ),
                  const HeightFull(),
                  //  const Spacer(),

                  TextCustom(
                    data.desc2,
                    align: TextAlign.center,
                    size: 14,
                    color: Palette.dark,
                  ),
                  const Spacer()
                ]),
              ),
            )
          ]),
        ));
  }
}
