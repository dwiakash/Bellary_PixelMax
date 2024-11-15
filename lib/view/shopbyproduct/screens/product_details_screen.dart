import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/appbars/appbar_common.dart';
import '../../../common/widgets/custom_scaffold.dart';
import '../widget/product_card.dart';
import '../widget/coupon_card.dart';
import '../widget/variation_card.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({Key? key}) : super(key: key);

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        title: 'Product Details',
        hadCart: true,
        hadNotifications: true,
      ),
      body: Consumer<ProductProvider>(builder: (context, product, child) {
        return Column(
          children: [
            const NetworkImageCustom(logo: ''),
            Container(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: const Column(
                children: [
                  ProductCard(),
                  HeightHalf(),
                  CouponCard(),
                  VariationCard(),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
