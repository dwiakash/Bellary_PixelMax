import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/view/service_category/widgets/service_category_item.dart';
import 'package:flutter/material.dart';

class ServiceCategoryGrid extends StatelessWidget {
  const ServiceCategoryGrid({
    super.key,
    required this.categories,
    this.showLess = false,
  });
  final List<Category> categories;
  final bool showLess;

  @override
  Widget build(BuildContext context) {
    int count = categories.length;
    if (showLess && count > 6) count = 6;
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .8,
            mainAxisSpacing: SizeUnit.lg,
            crossAxisSpacing: SizeUnit.lg),
        itemBuilder: (context, index) =>
            ServiceCategoryItem(category: categories[index]));
  }
}
