import 'package:bellaryapp/common/widgets/dotted_line.dart';
import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/models/shop.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.shop,
  });
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    ImageModel? image = shop.images?.firstOrNull;
    return InkWell(
      onTap: () => context.push(Routes.shopDetail, extra: shop),
      child: SizedBox(
        width: context.widthFull() - 80,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // Container(
          //   height: 100,
          //   width: 100,
          //   decoration: ThemeGuide.cardDecoration(color: Palette.accent),
          // ),
          ClipRRect(
            borderRadius: ThemeGuide.borderRadius(),
            child: NetworkImageCustom(
              logo: image?.image ?? '',
              height: 100,
              width: 100,
            ),
          ),
          const WidthFull(),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(shop.name ?? '',
                      maxLines: 1, fontWeight: FontWeight.w700, size: 16),
                  const SizedBox(height: 2),
                  Row(children: [
                    const Icon(Icons.location_on_outlined, size: 18),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TextCustom(shop.address ?? '',
                          maxLines: 1, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const HeightHalf(),
                  Row(children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 2),
                    Expanded(
                      child: TextCustom(shop.timings,
                          maxLines: 1, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const HeightFull(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeUnit.xlg),
                    child: DottedLine(color: Palette.grey),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
