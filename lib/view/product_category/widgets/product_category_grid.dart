import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/view/product_category/widgets/product_category_item.dart';
import 'package:flutter/material.dart';

class ProductCategoryGrid extends StatelessWidget {
  const ProductCategoryGrid({
    super.key,
    required this.categories,
    this.showLess = false,
  });
  final List<Category> categories;
  final bool showLess;

  @override
  Widget build(BuildContext context) {
    int count = categories.length;
    if (showLess && count > 8) count = 8;
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: .8,
            mainAxisSpacing: SizeUnit.lg,
            crossAxisSpacing: SizeUnit.lg),
        itemBuilder: (context, index) =>
            ProductCategoryItem(category: categories[index]));
  }
}
