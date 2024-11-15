import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(width: 50, child: DividerCustom(thickness: 5)),
      HeightFull(),
    ]);
  }
}
