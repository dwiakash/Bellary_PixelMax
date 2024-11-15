import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/view/home/widgets/heading.dart';
import 'package:bellaryapp/view/product/widgets/product_list.dart';
import 'package:flutter/material.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Heading(title: 'Top Picks for you'),
      HeightHalf(),
      ProductList(),
    ]);
  }
}
