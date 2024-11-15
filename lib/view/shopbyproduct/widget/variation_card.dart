import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:bellaryapp/utilities/extensions/double_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/buttons.dart';
import '../../../constants/size_unit.dart';

class VariationCard extends StatelessWidget {
  const VariationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextCustom(
            "Select your Preferred Color/Model",
            fontWeight: FontWeight.bold,
            size: 14,
            color: Palette.primary,
          ),
          SizedBox(
              width: context.widthFull(),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .9,
                      mainAxisSpacing: SizeUnit.lg,
                      crossAxisSpacing: SizeUnit.lg),
                 // physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  //  itemCount: 10,
                  //   scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: context.heightQuarter() / 2,
                      color: Palette.grey,
                      child: const TextCustom("value"),
                    );
                  })),
        ]);
  }
}
