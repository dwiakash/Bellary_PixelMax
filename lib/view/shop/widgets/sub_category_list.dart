import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/providers/shop_provider.dart';
import 'package:bellaryapp/repositories/shop_repository.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategoryList extends StatefulWidget {
  const SubCategoryList({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => init());
    super.initState();
  }

  List<Category> subCategories = [];
  void init() {
    subCategories = widget.category.subcategories ?? [];
    if (shopProvider.selectedSubCategory != null) return;
    selectCategory();
  }

  void selectCategory({int? index}) {
    Category? selectedSubCategory =
        index == null ? subCategories.firstOrNull : subCategories[index];
    if (selectedSubCategory == shopProvider.selectedSubCategory) return;
    shopProvider.selectedSubCategory = selectedSubCategory;
    ShopRepository().getProducts(context, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: Row(
            children: List.generate(subCategories.length, (i) {
          Category subCategory = subCategories[i];
          bool isSelected = subCategory == value.selectedSubCategory;
          return Padding(
            padding: EdgeInsets.only(left: i == 0 ? 0 : SizeUnit.lg),
            child: InkWell(
              onTap: () => selectCategory(index: i),
              child: Chip(
                  color: WidgetStatePropertyAll(
                      isSelected ? Palette.primary : null),
                  side: isSelected
                      ? const BorderSide(color: Palette.primary)
                      : null,
                  label: TextCustomtranslate(
                    subCategory.name ?? '',
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Palette.pureWhite : null,
                  )),
            ),
          );
        })),
      ),
    );
  }
}
