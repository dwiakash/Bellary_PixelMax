import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextCustom(
            "Leather Crossbody Bag",
            size: 16,
            fontWeight: FontWeight.bold,
          ),
          TextCustom(
            "\u{20B9} 2000",
            size: 16,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
      HeightHalf(),
      TextCustom(
        "Stylish leather bag with adjustable strap and sleek design. Perfect for everyday use.",
        //  fontWeight: FontWeight.bold,
        size: 14,
      ),
    ]);
  }
}
