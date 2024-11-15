import 'package:bellaryapp/common/widgets/bottom_sheets.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/view/shop/screens/select_category_screen.dart';
import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => commonBottomSheet(
            context, const SelectCategoryScreen(),
            padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg)),
        iconAlignment: IconAlignment.end,
        icon: const Icon(Icons.arrow_drop_down, color: Palette.dark),
        label: TextCustomtranslate(
          category.name ?? 'Category',
          maxLines: 1,
          color: Palette.dark,
          align: TextAlign.start,
          size: 16,
          fontWeight: FontWeight.w700,
        ));
  }
}
