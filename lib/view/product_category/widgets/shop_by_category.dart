import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/category_provider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/product_category/widgets/product_category_grid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, category, child) => Column(children: [
        if (category.productCategories.isNotEmpty) ...[
          const HeightHalf(),
          Heading(
              title: 'Shop by Category',
              onViewAll: () => context.push(Routes.productCategory)),
          ProductCategoryGrid(
              categories: category.productCategories, showLess: true)
        ],
      ]),
    );
  }
}
