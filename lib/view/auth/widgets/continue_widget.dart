import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:flutter/material.dart';

class ContinueWidget extends StatelessWidget {
  const ContinueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: SizeUnit.sm),
      child: Row(children: [
        Expanded(child: DividerCustom()),
        WidthFull(),
        TextCustom('Or Continue with', fontWeight: FontWeight.bold),
        WidthFull(),
        Expanded(child: DividerCustom()),
      ]),
    );
  }
}
