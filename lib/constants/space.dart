import 'package:flutter/material.dart';
import '/constants/size_unit.dart';

class HeightFull extends StatelessWidget {
  const HeightFull({super.key, this.multiplier = 1});
  final int? multiplier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUnit.lg * multiplier!,
    );
  }
}

class WidthFull extends StatelessWidget {
  const WidthFull({super.key, this.multiplier = 1});
  final int? multiplier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUnit.lg * multiplier!,
    );
  }
}

class HeightHalf extends StatelessWidget {
  const HeightHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: SizeUnit.sm,
    );
  }
}

class WidthHalf extends StatelessWidget {
  const WidthHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: SizeUnit.sm,
    );
  }
}
