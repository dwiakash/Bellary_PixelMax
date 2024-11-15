import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/view/home/widgets/offers_tile.dart';
import 'package:bellaryapp/view/product_category/widgets/shop_by_category.dart';
import 'package:bellaryapp/view/shopping/widgets/groceries.dart';
import 'package:bellaryapp/view/shopping/widgets/trending_deals.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final contSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
          title: 'Shopping',
          automaticLeadingImplies: false,
          hadCart: true,
          hadNotifications: true),
      body: ListView(padding: EdgeInsets.zero, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          child: TextFormFieldCustom(
              controller: contSearch,
              hint: 'Search for',
              prefix: const Icon(Icons.search)),
        ),
        const ShopByCategory(),
        // const ExploreServices(),
        const HeightFull(),
        const OffersTile(),
        const TrendingDeals(),
        const HeightFull(),
        const OffersTile(),
        const Groceries(),
        const HeightFull(),
      ]),
    );
  }
}
