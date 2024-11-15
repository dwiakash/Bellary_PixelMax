import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class FilterListTile extends StatelessWidget {
  const FilterListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onSort,
      required this.onFilter});
  final String title, subTitle;
  final VoidCallback onSort, onFilter;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const DividerCustom(),
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: SizeUnit.sm, horizontal: SizeUnit.lg),
        child: Row(children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextCustom(title, fontWeight: FontWeight.w700),
              TextCustom(subTitle, size: 12, fontWeight: FontWeight.w500),
            ]),
          ),
          const WidthFull(),
          ButtonMini(
              onTap: onSort,
              title: 'Sort by',
              icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 20)),
          const WidthFull(),
          ButtonMini(
              onTap: onFilter,
              title: 'Filter',
              icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 20))
        ]),
      ),
      const DividerCustom(),
    ]);
  }
}
