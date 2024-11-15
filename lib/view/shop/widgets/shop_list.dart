import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/shop_provider.dart';
import 'package:bellaryapp/view/shop/widgets/shop_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopList extends StatelessWidget {
  const ShopList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, shop, child) => ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shop.shops.length,
          separatorBuilder: (context, index) => const HeightFull(),
          itemBuilder: (context, index) =>
              FadeInUp(child: ShopTile(shop: shop.shops[index]))),
    );
  }
}
