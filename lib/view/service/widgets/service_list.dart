import 'package:animate_do/animate_do.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/providers/service_provider.dart';
import 'package:bellaryapp/view/service/widgets/service_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(
      builder: (context, service, child) => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        itemCount: service.services.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const HeightFull(),
        itemBuilder: (context, index) =>
            FadeInUp(child: ServiceTile(services: service.services[index])),
      ),
    );
  }
}
