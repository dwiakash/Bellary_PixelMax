import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/appbars/appbar_image_stacked.dart';
import 'package:bellaryapp/common/widgets/filter_list_tile.dart';
import 'package:bellaryapp/common/widgets/select_location_widget.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/view/shop/widgets/shop_list.dart';
import 'package:flutter/material.dart';

class LocalShopsScreen extends StatefulWidget {
  const LocalShopsScreen({super.key});

  @override
  State<LocalShopsScreen> createState() => _LocalShopsScreenState();
}

class _LocalShopsScreenState extends State<LocalShopsScreen> {
  final contSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        const AppBarImageStacked(
            hadMenu: true,
            image: LocalImages.localShops,
            titleWidget: SelectLocationWidget(color: Palette.pureWhite),
            head: 'Local Shops & offers',
            desc: 'Trusted Shops around \nyou with great offers'),
        FadeInLeft(
          child: Padding(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: TextFormFieldCustom(
                  controller: contSearch,
                  hint: 'Search for',
                  prefix: const Icon(Icons.search))),
        ),
        FadeInRight(
          child: FilterListTile(
              title: 'Shops Near You',
              subTitle: 'Find Shops by Category',
              onSort: onSort,
              onFilter: onFilter),
        ),
        const ShopList()
      ]),
    );
  }

  void onSort() {}
  void onFilter() {}
}
