import '/common/widgets/text.dart';
import 'package:flutter/material.dart';
import '/constants/size_unit.dart';
import '/constants/space.dart';
import '/theme/palette.dart';
import '/theme/theme_guide.dart';

import 'loaders.dart';

class ButtonPrimary extends ElevatedButton {
  /// Creates a Material Design elevated button.
  ButtonPrimary(
      {super.key,
      required void Function()? onPressed,
      required String label,
      Widget? icon,
      double? size,
      EdgeInsets? padding,
      bool isLoading = false})
      : super(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(SizeUnit.lg),
              child: isLoading
                  ? const Loader(color: Palette.pureWhite)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                          label,
                          size: size ?? 16,
                          fontWeight: FontWeight.bold,
                        ),
                        if (icon != null) ...[
                          padding == null
                              ? const WidthFull()
                              : const WidthHalf(),
                          icon
                        ],
                      ],
                    ),
            ),
            onPressed: isLoading ? () {} : onPressed);
}

class ButtonOutlined extends OutlinedButton {
  /// Creates a Material Design outlined button.
  ButtonOutlined(
      {super.key,
      required void Function()? onPressed,
      required String label,
      Widget? icon,
      EdgeInsets? padding,
      double? size,
      bool isLoading = false})
      : super(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(SizeUnit.lg),
              child: isLoading
                  ? const Loader()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                          label,
                          size: size ?? 16,
                          fontWeight: FontWeight.bold,
                        ),
                        if (icon != null) ...[const WidthFull(), icon],
                      ],
                    ),
            ),
            onPressed: isLoading ? () {} : onPressed);
}

class DoubleButton extends StatelessWidget {
  const DoubleButton(
      {super.key,
      required this.primaryLabel,
      required this.secondarylabel,
      required this.primaryOnTap,
      required this.secondaryOnTap,
      this.isLoading = false});
  final String primaryLabel, secondarylabel;
  final VoidCallback primaryOnTap, secondaryOnTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: 54,
        duration: const Duration(milliseconds: 400),
        decoration: ThemeGuide.cardDecoration(color: color),
        alignment: Alignment.center,
        padding: EdgeInsets.all(isLoading ? SizeUnit.lg : 0),
        child: isLoading
            ? const Loader(color: Palette.pureWhite)
            : Row(children: [
                Expanded(
                  child: ButtonOutlined(
                      onPressed: secondaryOnTap,
                      label: secondarylabel,
                      isLoading: isLoading),
                ),
                const WidthFull(),
                Expanded(
                  child: ButtonPrimary(
                      onPressed: primaryOnTap,
                      label: primaryLabel,
                      isLoading: isLoading),
                ),
              ]));
  }

  Color get color => isLoading ? Palette.primary : Colors.transparent;
}

class ButtonSecondary extends FilledButton {
  /// Creates a Material Design filled button.
  ButtonSecondary(
      {super.key,
      required void Function()? onPressed,
      required String label,
      bool isLoading = false})
      : super(
            child: Padding(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: isLoading
                  ? const Loader()
                  : TextCustom(label,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.pureWhite),
            ),
            onPressed: isLoading ? () {} : onPressed);
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key,
      this.title = '',
      required this.value,
      required this.onChanged});
  final String title;
  final bool value;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: boxColor,
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: ThemeGuide.borderRadius(radius: SizeUnit.sm / 2)),
          child: const Icon(Icons.check, color: Palette.pureWhite, size: 16),
        ),
        if (title.isNotEmpty) ...[
          const WidthHalf(),
          TextCustom(
            title,
            color: Palette.secondary,
            fontWeight: FontWeight.bold,
          )
        ]
      ]),
    );
  }

  Color get boxColor => value ? Palette.primary : Palette.pureWhite;
  Color get borderColor => value ? Palette.primary : Palette.secondary;
}

class SecondaryIconButton extends IconButton {
  SecondaryIconButton(BuildContext context,
      {super.key, required super.onPressed, required super.icon})
      : super(
          style: IconButtonTheme.of(context).style?.copyWith(
              foregroundColor: const WidgetStatePropertyAll(Palette.pureWhite),
              backgroundColor:
                  WidgetStatePropertyAll(Palette.dark.withOpacity(.2))),
        );
}

class ButtonMini extends StatelessWidget {
  const ButtonMini({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: ThemeGuide.cardDecoration(
              border: Border.all(color: Palette.dark)),
          padding: const EdgeInsets.symmetric(
              horizontal: SizeUnit.sm, vertical: SizeUnit.sm / 2),
          child: Row(children: [
            const WidthHalf(),
            TextCustom(
              title,
              size: 12,
              fontWeight: FontWeight.w700,
            ),
            if (icon != null) icon! else const WidthHalf()
          ])),
    );
  }
}
