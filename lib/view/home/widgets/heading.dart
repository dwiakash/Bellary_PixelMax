import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.title,
    this.onViewAll,
    this.subTitle,
    this.isPadded = false,
  });
  final bool isPadded;
  final String title;
  final String? subTitle;
  final VoidCallback? onViewAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
      child: Row(children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextCustom(title, fontWeight: FontWeight.w700, size: 18),
            if (subTitle != null) TextCustom(subTitle!),
          ]),
        ),
        if (onViewAll != null) ...[
          const WidthFull(),
          TextButton.icon(
            onPressed: onViewAll,
            label: const TextCustom('View all'),
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.arrow_outward_outlined, size: 18),
          ),
        ]
      ]),
    );
  }
}
