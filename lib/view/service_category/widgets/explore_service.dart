import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/category_provider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/service_category/widgets/service_category_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ExploreServices extends StatelessWidget {
  const ExploreServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, category, child) => Column(children: [
        if (category.serviceCategories.isNotEmpty) ...[
          const HeightHalf(),
          Heading(
              title: 'Explore Services',
              onViewAll: () => context.push(Routes.serviceCategory)),
          // CategoryGrid(categories: service.services),
          ServiceCategoryGrid(
              categories: category.serviceCategories, showLess: true)
        ],
      ]),
    );
  }
}
