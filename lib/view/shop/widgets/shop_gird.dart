import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/shop.dart';
import 'package:bellaryapp/view/shop/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ShopGrid extends StatelessWidget {
  const ShopGrid({super.key, required this.shops});
  final List<Shop> shops;
  @override
  Widget build(BuildContext context) {
    if (shops.length == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        child: ShopTile(shop: shops[0]),
      );
    }
    return SizedBox(
      height: 240,
      child: GridView.builder(
          itemCount: shops.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .4,
            // crossAxisSpacing: SizeUnit.lg,
            mainAxisSpacing: SizeUnit.lg,
          ),
          itemBuilder: (context, index) => ShopTile(shop: shops[index])),
    );
  }
}
