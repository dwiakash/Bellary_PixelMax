import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/providers/category_provider.dart';
import 'package:bellaryapp/view/product_category/widgets/product_category_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(title: 'Shop by Category'),
      body: Consumer<CategoryProvider>(
          builder: (context, cat, child) => ListView(
                padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
                children: [
                  ProductCategoryGrid(categories: cat.productCategories),
                ],
              )),
    );
  }
}
