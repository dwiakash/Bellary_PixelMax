import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/shimmer_grid.dart';
import 'package:bellaryapp/common/widgets/shimmer_list.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/product.dart';
import 'package:bellaryapp/view/product/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid(
      {super.key, required this.products, required this.isLoading});
  final List<Product> products;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    if (isLoading) return const ShimmerGrid();
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        shrinkWrap: true,
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeUnit.lg,
            childAspectRatio: .8,
            mainAxisSpacing: SizeUnit.lg),
        itemBuilder: (context, index) =>
            FadeInUp(child: ProductTile(product: products[index])));
  }
}
