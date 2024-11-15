import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/models/pagination.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class CustomPaginator extends StatelessWidget {
  const CustomPaginator(
      {super.key, required this.pagination, required this.onPageChange});
  final Pagination pagination;
  final Function(int) onPageChange;
  @override
  Widget build(BuildContext context) {
    if ((pagination.lastPage ?? 1) == 1) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
      child: Theme(
        data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
                secondary: Palette.primary, primary: Palette.dark)),
        child: NumberPaginator(
            initialPage: (pagination.currentPage ?? 1) - 1,
            numberPages: pagination.lastPage ?? 10,
            onPageChange: (index) => onPageChange(index + 1)),
      ),
    );
  }
}
