import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/buttons.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeightFull(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                "20% Offers Available",
                fontWeight: FontWeight.bold,
                size: 14,
                color: Palette.primary,
              ),
              ButtonMini(
                  colors: Palette.primary,
                  onTap: () {},
                  title: 'Added',
                  titlecolors: Palette.pureWhite,
                  icon: const Icon(
                    Icons.check,
                    size: 20,
                    color: Palette.pureWhite,
                  )),
            ],
          ),

          const TextCustom(
            "Estimated Delivery Time : 27/08/2024",
            fontWeight: FontWeight.bold,
            size: 14,
          ),
          //
          const DividerCustom(),
          //
        ]);
  }
}
