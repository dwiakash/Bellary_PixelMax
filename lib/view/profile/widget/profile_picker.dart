import 'dart:io';

import 'package:bellaryapp/common/widgets/bottom_sheets.dart';
import 'package:bellaryapp/common/widgets/image_circle.dart';
import 'package:bellaryapp/constants/assets/local_images.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:bellaryapp/view/profile/widget/profile_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProfilePicker extends StatelessWidget {
  const ProfilePicker({
    super.key,
    required this.pickedImage,
    required this.onPicked,
  });

  final File? pickedImage;
  final Function(File? file) onPicked;

  @override
  Widget build(BuildContext context) {
    String image = authProvider.user?.profile?.image ?? '';
    return GestureDetector(
      onTap: () => commonBottomSheet(
          context, ProfilePickerBottomSheet(onPicked: onPicked)),
      child: Stack(
        alignment: const Alignment(.9, .9),
        children: [
          Container(
            width: context.widthQuarter(),
            height: context.widthQuarter(),
            decoration: BoxDecoration(
                borderRadius: ThemeGuide.borderRadius(radius: 100)),
            clipBehavior: Clip.antiAlias,
            child: pickedImage != null
                ? Image.file(pickedImage!, fit: BoxFit.cover)
                : image.isEmpty
                    ? Image.asset(LocalImages.placeHolder, fit: BoxFit.cover)
                    : ProfileCircle(radius: 100, image: image),
          ),
          const CircleAvatar(
              radius: 16,
              backgroundColor: Palette.primary,
              child: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
