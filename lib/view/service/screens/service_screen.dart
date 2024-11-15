import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/common/widgets/text_fields.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/view/home/widgets/offers_tile.dart';
import 'package:bellaryapp/view/service/widgets/most_booked_service.dart';
import 'package:bellaryapp/view/service_category/widgets/explore_service.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final contSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
          title: 'Services',
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
        const ExploreServices(),
        const HeightFull(),
        const OffersTile(),
        const MostBookedService(),
        const HeightFull(),
      ]),
    );
  }
}
