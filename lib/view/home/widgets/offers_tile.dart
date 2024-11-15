import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:flutter/material.dart';

class OffersTile extends StatelessWidget {
  const OffersTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeUnit.lg),
      margin: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
      decoration: ThemeGuide.cardDecoration(color: Palette.primary),
      child: Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextCustom('Festival is Here',
                color: Palette.pureWhite,
                size: 20,
                fontWeight: FontWeight.w700),
            const SizedBox(height: 2),
            // const HeightHalf(),
            const TextCustom('Offer Available',
                size: 16, fontWeight: FontWeight.w600),
            const SizedBox(height: 4),
            const TextCustom('Upto 20% OFF'),
            const HeightFull(),
            Container(
              decoration: ThemeGuide.cardDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                TextCustom('Shop Now ',
                    color: Palette.primary, fontWeight: FontWeight.bold),
                Icon(Icons.arrow_outward_outlined,
                    color: Palette.primary, size: 16)
              ]),
            )
          ]),
        ),
        const WidthFull(),
        Image.asset(LocalImages.shopOffer, width: 100)
      ]),
    );
  }
}
