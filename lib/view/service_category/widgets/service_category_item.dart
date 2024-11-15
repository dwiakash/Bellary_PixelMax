import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/repositories/service_repository.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceCategoryItem extends StatelessWidget {
  const ServiceCategoryItem({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped(context),
      child: Column(
        children: [
          Expanded(
              child: Hero(
            tag: category.key ?? UniqueKey().toString(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeUnit.borderRadius),
                child: NetworkImageCustom(logo: category.image ?? '')),
          )),
          const HeightHalf(),
          TextCustom(category.name ?? '',
              maxLines: 1,
              fontWeight: FontWeight.w600,
              align: TextAlign.center),
        ],
      ),
    );
  }

  void onTapped(BuildContext context) {
    ServiceRepository().getServices(context, category);
    context.push(Routes.serviceList, extra: category);
  }
}
