import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/image_model.dart';
import 'package:bellaryapp/models/service.dart';
import 'package:bellaryapp/theme/Palette.dart';
import 'package:bellaryapp/utilities/extensions/string_extenstion.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key, required this.services});
  final Service services;
  @override
  Widget build(BuildContext context) {
    ImageModel? image = services.images?.firstOrNull;
    return InkWell(
      child: Column(children: [
        Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(SizeUnit.borderRadius),
              child: NetworkImageCustom(
                logo: image?.image ?? '',
                width: 150,
                height: 140,
              )),
          const WidthFull(),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: TextCustom(services.name ?? '',
                        maxLines: 1, size: 16, fontWeight: FontWeight.w700),
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              const HeightHalf(),
              TextCustom(services.description ?? '',
                  maxLines: 2, fontWeight: FontWeight.w500),
              if (services.dicountPercent != null) ...[
                const HeightHalf(),
                TextCustom('${services.dicountPercent}% Offers',
                    maxLines: 1,
                    color: Palette.primary,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.center)
              ],
              const HeightHalf(),
              TextCustom(services.sellingPrice.toString().money(),
                  maxLines: 1,
                  size: 16,
                  fontWeight: FontWeight.w600,
                  align: TextAlign.center),
            ]),
          )
        ]),
        const HeightHalf(),
        const DividerCustom()
      ]),
    );
  }
}
