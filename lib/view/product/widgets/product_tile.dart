import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/models/product.dart';
import 'package:bellaryapp/models/service.dart';
import 'package:bellaryapp/theme/Palette.dart';
import 'package:bellaryapp/utilities/extensions/string_extenstion.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    Skus? sku = product.skus?.firstOrNull;
    ImageModel? image = sku?.images?.firstOrNull;
    AttributeElement? attributeElement = sku?.attributes?.firstOrNull;
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeUnit.borderRadius),
                  child: NetworkImageCustom(
                    logo: image?.image ?? '',
                  )),
            ),
            const HeightHalf(),
            TextCustomtranslate(product.name ?? '',
                maxLines: 1,
                size: 16,
                fontWeight: FontWeight.w600,
                align: TextAlign.center),
            TextCustomtranslate(attributeElement?.value ?? '',
                maxLines: 1,
                fontWeight: FontWeight.w600,
                align: TextAlign.center),
            const HeightHalf(),
            TextCustomtranslate((sku?.sellingPrice ?? '').money(),
                maxLines: 1,
                size: 16,
                fontWeight: FontWeight.w600,
                align: TextAlign.center),
          ],
        ),
      );
    });
  }
}
