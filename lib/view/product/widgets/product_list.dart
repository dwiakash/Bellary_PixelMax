import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/product.dart';
import 'package:bellaryapp/view/product/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const WidthFull(),
          itemBuilder: (context, index) => FadeInUp(
              child:  SizedBox(
                  width: 150,
                  child: ProductTile(
                    product: Product(),
                  )))),
    );
  }
}
