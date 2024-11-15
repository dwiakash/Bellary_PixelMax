import 'package:bellaryapp/common/widgets/text.dart';
import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });
  final String text1, text2;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextCustom(text1),
        TextButton(onPressed: onPressed, child: TextCustom(text2))
      ],
    );
  }
}
