import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/buttons.dart';
import 'package:bellaryapp/common/widgets/text.dart';
import 'package:bellaryapp/constants/size_unit.dart';
import 'package:bellaryapp/repositories/auth_repository.dart';
import 'package:bellaryapp/theme/palette.dart';
import 'package:bellaryapp/utilities/extensions/context_extention.dart';
import 'package:bellaryapp/view/cms/widget/address_container.dart';
import 'package:bellaryapp/view/cms/widget/appbar_extended.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_scaffold.dart';
import '../../../common/widgets/text_fields.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final contEmail = TextEditingController();
  final contName = TextEditingController();
  final contMobile = TextEditingController();
  final contSubject = TextEditingController();
  final contmsg = TextEditingController();

  final contPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        title: "Help & Support",
        backgroundColor: Palette.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Appbarcontainer(),
            Container(
              padding: const EdgeInsets.all(SizeUnit.lg),
              width: context.widthFull(),
              height: context.heightFull(),
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Addresscontainer(),
                    const TextCustom('Enter Your Name'),
                    const SizedBox(height: SizeUnit.sm),
                    TextFormFieldCustom(
                      controller: contName,
                      label: 'Name',
                      hint: 'Enter your Name',
                      keyboardType: TextInputType.name,
                      // prefix: const Icon(Icons.account_box_rounded),
                    ),
                    const SizedBox(height: SizeUnit.sm),
                    const TextCustom('Email Id'),
                    const SizedBox(height: SizeUnit.sm),
                    TextFormFieldCustom(
                      controller: contEmail,
                      label: 'Email Id',
                      hint: 'Enter your Email Id',
                      keyboardType: TextInputType.emailAddress,
                      // prefix: const Icon(Icons.mail_outline),
                    ),
                    const SizedBox(height: SizeUnit.sm),
                    const TextCustom('Mobile number'),
                    const SizedBox(height: SizeUnit.sm),
                    TextFormFieldCustom(
                      controller: contMobile,
                      label: 'Mobile number',
                      hint: 'Enter your Mobile number',
                      keyboardType: TextInputType.number,
                      //   prefix: const Icon(Icons.phone),
                    ),
                    const SizedBox(height: SizeUnit.sm),
                    const TextCustom('Subject'),
                    const SizedBox(height: SizeUnit.sm),
                    TextFormFieldCustom(
                      controller: contMobile,
                      label: 'Subject',
                      hint: 'Enter your Subject',
                      keyboardType: TextInputType.text,
                      //  prefix: const Icon(Icons.phone),
                    ),
                    const SizedBox(height: SizeUnit.sm),
                    const TextCustom('Your Query'),
                    const SizedBox(height: SizeUnit.sm),
                    AddressTextfield(
                      controller: contmsg,
                      hint: "Please write your Query...",
                      label: "Please write your Query",
                      // obscured: false,
                      //  length: 3,
                    ),
                    const SizedBox(height: SizeUnit.xlg),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonPrimary(
                              onPressed: () => onSubmit(context),
                              label: "Submit"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onSubmit(BuildContext context) {
  //call the API
  // context.push(Routes.home);
  AuthRepository().navigateHome(context);
}

Widget buildTextField(String label, String hint, Function(String) onChanged,
    {int maxLines = 1, bool isQueryBox = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      textAlignVertical: isQueryBox ? TextAlignVertical.top : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: isQueryBox,
        fillColor: isQueryBox
            ? Colors.grey[300]
            : null, // Set grey background for query box
        alignLabelWithHint: true, // Align label to top-left if multiline
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        contentPadding: isQueryBox
            ? const EdgeInsets.all(
                10.0) // Add padding to align text to top-left
            : const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    ),
  );
}
