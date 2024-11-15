import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';

import 'package:flutter/material.dart';

import '../../../constants/size_unit.dart';

import '../widget/myprofilecontainer.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarCommon(
          title: "Profile",
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(SizeUnit.lg),
          child: Myprofilecontainer()),
    );
  }
}
