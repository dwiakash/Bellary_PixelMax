import 'package:flutter/material.dart';

import '../../../common/widgets/text.dart';
import '../../../constants/size_unit.dart';
import '../../../constants/space.dart';

class Addresscontainer extends StatelessWidget {
  const Addresscontainer({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom('Contact US', size: 20, fontWeight: FontWeight.bold),
        HeightHalf(),
        TextCustom(
            'Location: 1st floor No 48/9 1st cross 5th main, Maruthi nagar, Chandra layout Bengaluru, Karnataka'),
        HeightHalf(),
        TextCustom('Pincode: 560072'),
        HeightHalf(),
        TextCustom('Contact No: 8550051555'),
        SizedBox(height: SizeUnit.sm),
     
      ],
    );
  }
}
