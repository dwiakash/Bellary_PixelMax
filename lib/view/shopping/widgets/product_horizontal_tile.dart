import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/models/service.dart';
import 'package:bellaryapp/theme/Palette.dart';
import 'package:bellaryapp/utilities/extensions/string_extenstion.dart';
import 'package:flutter/material.dart';

class ProductHorizontalTile extends StatelessWidget {
  const ProductHorizontalTile({super.key, required this.services});
  final Service services;
  @override
  Widget build(BuildContext context) {
    ImageModel? image = services.images?.firstOrNull;
    return InkWell(
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(SizeUnit.borderRadius),
                    child: NetworkImageCustom(
                      logo: image?.image ?? '',
                      width: 150,
                    ))),
            const HeightHalf(),
            TextCustom(services.name ?? '',
                maxLines: 1,
                size: 16,
                fontWeight: FontWeight.w600,
                align: TextAlign.center),
            if (services.dicountPercent != null)
              TextCustom('${services.dicountPercent}% Offers',
                  maxLines: 1,
                  color: Palette.primary,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center),
            TextCustom(services.sellingPrice.toString().money(),
                maxLines: 1,
                size: 16,
                fontWeight: FontWeight.w600,
                align: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
