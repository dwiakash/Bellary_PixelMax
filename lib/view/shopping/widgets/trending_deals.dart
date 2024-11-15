import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/service_provider.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/shopping/widgets/product_horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingDeals extends StatelessWidget {
  const TrendingDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, service, child) => Column(children: [
        if (service.mostBookedServices.isNotEmpty) ...[
          const HeightFull(),
          const Heading(title: 'Trending Deals'),
          const HeightFull(),
          ProductHorizontalList(services: service.mostBookedServices)
        ],
      ]),
    );
  }
}
