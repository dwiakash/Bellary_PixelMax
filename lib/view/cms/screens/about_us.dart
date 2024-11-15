import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_scaffold.dart';
import '../../cms/widget/appbar_extended.dart';
import '../widget/aboutus_widget.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const AppBarCommon(
          title: "About Us",
          backgroundColor: Palette.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [const Appbarcontainer(), aboutuscontent()],
          ),
        ));
  }
  //
}
