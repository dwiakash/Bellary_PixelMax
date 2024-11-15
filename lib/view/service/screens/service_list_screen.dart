import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/common/widgets/appbars/appbar_image_stacked.dart';
import 'package:bellaryapp/common/widgets/filter_list_tile.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/view/service/widgets/service_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _LocalShopsScreenState();
}

class _LocalShopsScreenState extends State<ServiceListScreen> {
  final contSearch = TextEditingController();
  Category get category => GoRouterState.of(context).extra as Category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
            ListView(padding: EdgeInsets.zero, children: [
          AppBarImageStacked(
              heroTag: category.key,
              title: category.name ?? '',
              head: category.title ?? '',
              desc: category.subTitle ?? '',
              image: category.image ?? ''),
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
                title: 'Find Your Perfect Service',
                subTitle: 'Book ${category.name} Service Now',
                onSort: onSort,
                onFilter: onFilter),
          ),
          const HeightFull(),
          const ServiceList()
        ]),
   
    );
  }

  void onSort() {}
  void onFilter() {}
}
