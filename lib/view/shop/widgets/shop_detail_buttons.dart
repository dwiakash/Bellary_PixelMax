import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class ShopDetailButtons extends StatelessWidget {
  const ShopDetailButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
      child: Row(children: [
        ButtonPrimary(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeUnit.md, vertical: SizeUnit.sm),
            icon: const Icon(Icons.call, size: 16),
            onPressed: () {},
            size: 14,
            label: 'Call'),
        const WidthFull(),
        ButtonOutlined(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeUnit.md, vertical: SizeUnit.sm),
            icon: const Icon(Icons.chat_bubble_outline, size: 16),
            onPressed: () {},
            size: 14,
            label: 'Chat'),
        const WidthFull(),
        ButtonOutlined(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeUnit.md, vertical: SizeUnit.sm),
            icon: const Icon(Icons.location_on_outlined, size: 16),
            onPressed: () {},
            size: 14,
            label: 'Location'),
      ]),
    );
  }
}
