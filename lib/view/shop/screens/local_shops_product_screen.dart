import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/providers/shop_provider.dart';
import 'package:bellaryapp/view/product/widgets/product_grid.dart';
import 'package:bellaryapp/view/shop/widgets/select_category_widget.dart';
import 'package:bellaryapp/view/shop/widgets/sub_category_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LocalShopsProductScreen extends StatefulWidget {
  const LocalShopsProductScreen({super.key});

  @override
  State<LocalShopsProductScreen> createState() =>
      _LocalShopsProductScreenState();
}

class _LocalShopsProductScreenState extends State<LocalShopsProductScreen> {
  final contSearch = TextEditingController();
  Category get category => GoRouterState.of(context).extra as Category;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar:
          AppBarCommon(titleWidget: SelectCategoryWidget(category: category)),
      body: ListView(padding: EdgeInsets.zero, children: [
        FadeInLeft(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: TextFormFieldCustom(
                  controller: contSearch,
                  hint: 'Search for',
                  prefix: const Icon(Icons.search))),
        ),
        FadeInRight(child: SubCategoryList(category: category)),
        Consumer<ShopProvider>(
            builder: (context, value, child) => FadeInUp(
                child: ProductGrid(
                    products: value.products, isLoading: value.isLoading)))
      ]),
    );
  }

  void onSort() {}
  void onFilter() {}
}
