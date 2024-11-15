import 'package:bellaryapp/common/widgets/network_image_cus.dart';
import 'package:bellaryapp/constants/space.dart';
import 'package:bellaryapp/models/profile.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/repositories/profile_repository.dart';
import 'package:bellaryapp/theme/theme_guide.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:bellaryapp/utilities/extensions/double_extension.dart';
import 'package:bellaryapp/utilities/extensions/form_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/dropdown.dart';
import '../../../common/widgets/text.dart';
import '../../../common/widgets/text_fields.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/keys.dart';
import '../../../constants/size_unit.dart';

class Myprofilecontainer extends StatefulWidget {
  const Myprofilecontainer({
    super.key,
  });

  @override
  State<Myprofilecontainer> createState() => _MyprofilecontainerState();
}

class _MyprofilecontainerState extends State<Myprofilecontainer> {
  final contFullname = TextEditingController();
  final contNickname = TextEditingController();
  final contDob = TextEditingController();
  final contEmail = TextEditingController();
  final contMobile = TextEditingController();

  String selectedgender = AppStrings.genderList[0];
  String? selectedCode = '+91';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        contDob.text = DateFormat.yMMMd().format(selectedDate);
        //picked.day.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    contFullname.text = authProvider.user?.name ?? "";
    contEmail.text = authProvider.user?.email ?? "";
    contNickname.text = authProvider.user?.profile?.nickName ?? "";
    contMobile.text = (authProvider.user?.profile?.mobile.toString() == "null"
        ? ""
        : authProvider.user?.profile?.mobile.toString())!;
    contDob.text = authProvider.user?.profile?.dob ?? "";
    selectedgender = authProvider.user?.profile?.gender ?? selectedgender;
  }

  final profileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String image = authProvider.user?.profile?.image ?? '';
    return Form(
      key: profileKey,
      child: Column(children: [
        //const HeightFull(),
        Container(
          width: context.widthQuarter(),
          height: context.widthQuarter(),
          decoration:
              BoxDecoration(borderRadius: ThemeGuide.borderRadius(radius: 100)),
          clipBehavior: Clip.antiAlias,
          child: image.isEmpty
              ? Icon(Icons.account_circle,
                  size: context.widthQuarter(), color: Color(0xffD9D9D9))
              : NetworkImageCustom(
                  logo: authProvider.user?.profile?.image ?? ''),
          // const Icon(
          //   Icons.account_circle,
          //   size: SizeUnit.xlg * 6,
          //   color: Color(0xffD9D9D9),
        ),
        //  const HeightFull(multiplier: 3),
        const HeightFull(),
        TextFormFieldCustom(
          controller: contFullname,
          label: 'Full name',
          hint: 'Enter your Full name',
          keyboardType: TextInputType.name,
          //      prefix: const Icon(Icons.mail_outline),
        ),
        const HeightFull(),
        TextFormFieldCustom(
          controller: contNickname,
          label: 'Nick name',
          hint: 'Enter your Nick name',
          keyboardType: TextInputType.name,
        ),
        const HeightFull(),
        //dob
        TextFormFieldCustom(
          controller: contDob,
          label: 'Date Of Birth',
          hint: 'Select your DOB',
          onTap: () => _selectDate(context),
          suffix: const Icon(Icons.calendar_month),
          keyboardType: TextInputType.datetime,
        ),

        const HeightFull(),

        // const HeightFull(),
        TextFormFieldCustom(
          controller: contEmail,
          label: 'Email',
          hint: 'Enter your Email',
          suffix: const Icon(Icons.mail_outline),
          keyboardType: TextInputType.emailAddress,
        ),
        const HeightFull(),
        MobileTextField(
          contMobile: contMobile,
          selectedCode: selectedCode,
          onChanged: (e) => setState(() => selectedCode = e),
        ),
        const HeightFull(),
        DropDownCustom(
          value: selectedgender,
          isFilled: true,
          items: AppStrings.genderList.map((e) {
            return DropdownMenuItem(
              value: e,
              child: TextCustom(e),
            );
          }).toList(),
          isNoBorder: false,
          contentPadding: const EdgeInsets.fromLTRB(
              SizeUnit.lg, SizeUnit.lg, SizeUnit.sm, SizeUnit.lg),
          onChanged: (newValue) => setState(() {
            selectedgender = newValue.toString();
          }),
        ),
        const HeightFull(),
        Row(children: [
          Expanded(
              child: ButtonPrimary(
                  onPressed: onEdit,
                  //isLoading: auth.isLoading,
                  label: 'Save')),
        ]),
      ]),
    );
  }

  void onEdit() {
    if (profileKey.hasError) return;

    Profile prof = Profile(
        name: contFullname.text.trim(),
        nickName: contNickname.text,
        dob: selectedDate,
        gender: selectedgender,
        mobile: contMobile.text);

    logger.e(prof.toJson());
    ProfileRepository().editProfile(context, prof);
    // context.push(Routes.setting);
  }
}
