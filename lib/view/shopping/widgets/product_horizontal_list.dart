import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/service.dart';
import 'package:bellaryapp/view/service/widgets/service_horizontal_tile.dart';
import 'package:flutter/material.dart';

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList({
    super.key,
    required this.services,
  });
  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          itemCount: services.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const WidthFull(),
          itemBuilder: (context, index) =>
              ServiceHorizontalTile(services: services[index])),
    );
  }
}
