import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/shop.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/product_category/widgets/product_category_grid.dart';
import 'package:bellaryapp/view/shop/widgets/shop_detail_buttons.dart';
import 'package:bellaryapp/view/shop/widgets/shop_detail_head.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  Shop get shop => GoRouterState.of(context).extra as Shop;
  final contSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(hadCart: true, hadNotifications: true),
      body: ListView(padding: EdgeInsets.zero, children: [
        ShopDetailHead(shop: shop),
        const HeightFull(),
        const ShopDetailButtons(),
        const HeightFull(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          child: Row(children: [
            Expanded(
              child: TextFormFieldCustom(
                  controller: contSearch,
                  hint: 'Search for',
                  prefix: const Icon(Icons.search)),
            ),
            const WidthFull(),
            ButtonPrimary(
              onPressed: () {},
              label: 'Categories',
              icon: const Icon(Icons.keyboard_arrow_down),
            )
          ]),
        ),
        const HeightFull(),
        const Heading(title: 'Beverages'),
        const HeightHalf(),
        ProductCategoryGrid(categories: categoryProvider.productCategories),
      ]),
    );
  }
}
