import 'package:bellaryapp/common/widgets/appbars/app_bar_main.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/keys.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/providers/shop_provider.dart';
import 'package:bellaryapp/services/route/routes.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/home/widgets/offers_tile.dart';
import 'package:bellaryapp/view/product_category/widgets/shop_by_category.dart';
import 'package:bellaryapp/view/service/widgets/most_booked_service.dart';
import 'package:bellaryapp/view/service_category/widgets/explore_service.dart';
import 'package:bellaryapp/view/shop/widgets/shop_gird.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final contSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    logger.e(authProvider.accesstoken);
    return Consumer<ShopProvider>(
      builder: (context, shop, child) {
        return CustomScaffold(
            appBar: const AppBarMain(),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                  child: TextFormFieldCustom(
                      controller: contSearch,
                      hint: 'Search for',
                      prefix: const Icon(Icons.search)),
                ),
                const ShopByCategory(),
                const HeightFull(),
                const OffersTile(),
                if (shop.shops.isNotEmpty) ...[
                  const HeightFull(),
                  Heading(
                      title: 'Local Shops & Offers',
                      subTitle: 'Shop More, Save More',
                      onViewAll: () => context.go(Routes.localShops)),
                  const HeightHalf(),
                  ShopGrid(shops: shop.shops),
                ],
                const ExploreServices(),
                const MostBookedService(),
                const HeightFull(),
                const OffersTile(),
              ],
            ));
      },
    );
  }
}
