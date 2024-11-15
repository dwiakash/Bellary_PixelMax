import 'dart:io';

import 'package:bellaryapp/common/widgets/divider.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/services/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePickerBottomSheet extends StatelessWidget {
  const ProfilePickerBottomSheet({super.key, required this.onPicked});
  final Function(File?) onPicked;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(width: 50, child: DividerCustom(thickness: 5)),
      const HeightFull(),
      const Align(
        alignment: Alignment.centerLeft,
        child: TextCustomtranslate('Choose picture from',
            size: 18, fontWeight: FontWeight.w600),
      ),
      const HeightFull(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        TextButton.icon(
          label: const TextCustomtranslate('Camera', size: 16),
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () => onTap(context, ImageSource.camera),
        ),
        TextButton.icon(
          label: const TextCustomtranslate('Gallery', size: 16),
          icon: const Icon(Icons.collections_outlined),
          onPressed: () => onTap(context, ImageSource.gallery),
        )
      ]),
      const HeightFull(),
    ]);
  }

  void onTap(BuildContext context, ImageSource source) async {
    File? file = await CustomImagePicker().pickImage(source);
    onPicked(file);
    context.pop();
  }
}
