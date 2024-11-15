import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/models/shop.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:flutter/material.dart';

class ShopDetailHead extends StatelessWidget {
  const ShopDetailHead({
    super.key,
    required this.shop,
  });

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    ImageModel? image = shop.images?.firstOrNull;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
      child: Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextCustom(shop.name ?? '', fontWeight: FontWeight.w700, size: 16),
            const HeightHalf(),
            TextCustom('${shop.categoryId ?? 'Category'}',
                fontWeight: FontWeight.bold),
            const HeightHalf(),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.location_on_outlined, size: 18),
              const WidthHalf(),
              Expanded(
                child:
                    TextCustom(shop.address ?? '', fontWeight: FontWeight.bold),
              ),
            ]),
            const HeightHalf(),
            Row(children: [
              const Icon(Icons.access_time),
              const WidthHalf(),
              Expanded(
                child: TextCustom(shop.timings,
                    maxLines: 1, fontWeight: FontWeight.bold),
              ),
            ]),
          ]),
        ),
        ClipRRect(
          borderRadius: ThemeGuide.borderRadius(),
          child: NetworkImageCustom(
            logo: image?.image ?? '',
            height: 120,
          ),
        )
      ]),
    );
  }
}
