import 'package:flutter/material.dart';
import '/constants/size_unit.dart';
import '/theme/palette.dart';
import '/theme/theme_guide.dart';

class DropDownCustom<T> extends DropdownButtonFormField<T> {
  /// Optional text that describes the input field.
  final String? labelText;

  final bool isNoBorder;
  final EdgeInsets? contentPadding;
  final bool isFilled;

  /// A [DropDownCustom] that contains a [DropdownButton].
  ///
  /// This is a convenience widget that wraps a [DropdownButton] widget in a
  /// [FormField].
  ///
  /// A [Form] ancestor is not required. The [Form] allows one to
  /// save, reset, or validate multiple fields at once. To use without a [Form],
  /// pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
  /// save or reset the form field.
  DropDownCustom({
    super.key,
    required super.value,
    required super.items,
    required super.onChanged,
    this.labelText,
    this.contentPadding,
    this.isFilled = true,
    this.isNoBorder = false,
  }) : super(
          validator: (input) {
            if (value == null && (labelText ?? '').isNotEmpty) {
              return "$labelText is required";
            }
            return null;
          },
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            size: 30.0,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hoverColor: Palette.primary,
              focusColor: Palette.primary,
              errorStyle: const TextStyle(fontSize: 13, color: Palette.red),
              filled: isFilled,
              labelStyle: const TextStyle(color: Palette.grey, fontSize: 14),
              hintStyle: const TextStyle(color: Palette.grey, fontSize: 14),
              labelText: labelText,
              contentPadding:
                  contentPadding ?? const EdgeInsets.all(SizeUnit.lg),
              border: isNoBorder ? InputBorder.none : ThemeGuide.focussedBorder,
              errorBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.errorBorder,
              enabledBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.defaultBorder(),
              focusedBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.focussedBorder),
        );
}
