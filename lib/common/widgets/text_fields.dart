import 'package:bellaryapp/common/widgets/text.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '/constants/size_unit.dart';

import '/theme/palette.dart';
import 'package:flutter/material.dart';
import '/theme/theme_guide.dart';
import '/utilities/extensions/string_extenstion.dart';
import 'dropdown.dart';

class TextFormFieldCustom extends StatefulWidget {
  final TextEditingController controller;

  final String? label, hint;
  final TextInputType? keyboardType;
  final bool isOptional;
  final bool? enabled;
  final int? maxLength;
  final bool isCaptalizeAll, obscured;
  final Widget? suffix, prefix;
  final String? Function(String? input)? validator;
  final BorderRadius? borderRadius;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool isBorderLess;

  const TextFormFieldCustom({
    super.key,
    required this.controller,
    this.label,
    this.keyboardType,
    this.maxLength,
    this.isOptional = false,
    this.enabled,
    this.validator,
    this.isCaptalizeAll = false,
    this.obscured = false,
    this.suffix,
    required this.hint,
    this.prefix,
    this.borderRadius,
    this.onChanged,
    this.onTap,
    this.isBorderLess = false,
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.onTap != null,
      onTap: widget.onTap,
      inputFormatters: getInputFormatters,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: widget.obscured && !isVisible,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (i) {
        String input = i ?? '';
        // Checks if the field is optional and input is empty
        if (!widget.isOptional && input.isEmpty) {
          return "The ${widget.label} is required";
        }
        if (!widget.isOptional &&
            widget.keyboardType == TextInputType.emailAddress &&
            !input.isEmail) {
          return "Kindly enter valid mail";
        }
        // If the validator is not null custom validation logic to be performed
        if (widget.validator != null) {
          return widget.validator!(input);
        }
        // No validation errors
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: widget.prefix,
          counterText: '',
          suffixIcon: suffix,
          errorStyle: const TextStyle(fontSize: 13, color: Palette.red),
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          labelText: widget.label,
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
          border: ThemeGuide.focussedBorder,
          errorBorder: ThemeGuide.errorBorder,
          enabledBorder: ThemeGuide.defaultBorder(),
          focusedBorder: ThemeGuide.focussedBorder),
    );
  }

  Widget? get suffix {
    return widget.obscured
        ? InkWell(
            onTap: () {
              isVisible = !isVisible;
              setState(() {});
            },
            child: !isVisible
                ? const Icon(
                    Icons.visibility_off_outlined,
                    size: 18,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    size: 18,
                  ),
          )
        : widget.suffix;
  }

  List<TextInputFormatter> get getInputFormatters {
    if (widget.keyboardType == TextInputType.number ||
        widget.keyboardType == const TextInputType.numberWithOptions()) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    if (widget.isCaptalizeAll) {
      return [UpperCaseTextFormatter()];
    }
    if (widget.keyboardType == TextInputType.emailAddress) {
      return [LowerCaseTextFormatter()];
    }
    return <TextInputFormatter>[];
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class OtpField extends StatelessWidget {
  OtpField({super.key, required this.controller, this.onCompleted});
  final TextEditingController controller;
  final Function(String?)? onCompleted;
  @override
  Widget build(BuildContext context) {
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    return Pinput(
      keyboardType: TextInputType.number,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: onCompleted,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: Palette.secondary),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Palette.primary),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Palette.grey),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Palette.grey)));
}

// ignore: must_be_immutable
class MobileTextField extends StatelessWidget {
  MobileTextField(
      {super.key, required this.contMobile, this.selectedCode, this.onChanged});
  final TextEditingController contMobile;
  final String? selectedCode;
  final Function(String?)? onChanged;
  List<String> countryCodes = ['+91', '+92'];
  @override
  Widget build(BuildContext context) {
    return TextFormFieldCustom(
      controller: contMobile,
      label: 'Mobile',
      hint: 'Enter you mobile',
      maxLength: 10,
      keyboardType: TextInputType.number,
      prefix: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
            width: 80,
            child: DropDownCustom(
                value: selectedCode,
                isFilled: false,
                items: countryCodes
                    .map(
                        (e) => DropdownMenuItem(value: e, child: TextCustom(e)))
                    .toList(),
                isNoBorder: true,
                contentPadding: const EdgeInsets.fromLTRB(
                    SizeUnit.lg, SizeUnit.lg, SizeUnit.sm, SizeUnit.lg),
                onChanged: onChanged)),
        Container(
          width: 1,
          height: 45,
          color: Palette.muted,
          margin: const EdgeInsets.only(right: SizeUnit.lg),
        )
      ]),
    );
  }
}

class AddressTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final String? Function(String? input)? validator;
  final String customError;
  final String label;
  final int? length;

  final TextInputType? textInputType;
  const AddressTextfield({
    super.key,
    required this.controller,
    this.hint,
    this.textInputType,
    this.validator,
    this.customError = '',
    this.label = '',
    this.length,
  });

  @override
  State<AddressTextfield> createState() => _AddressTextfieldState();
}

class _AddressTextfieldState extends State<AddressTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 120,
        decoration: BoxDecoration(
          color: Palette.pureWhite,
          border: Border.all(color: Palette.dark),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(60),
          ],
          validator: widget.validator ??
              (value) {
                if (widget.customError.isNotEmpty) {
                  return widget.customError;
                }
                if (widget.controller.text.isEmpty) {
                  return "Please enter the ${widget.label.toLowerCase()}";
                }
                if (widget.length != null &&
                    widget.controller.text.length != widget.length) {
                  return "${widget.label} should be the length of ${widget.length}";
                }
                return null;
              },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          obscureText: false,
          cursorColor: Palette.primary,
          style: const TextStyle(),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: widget.label,
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 12),
              fillColor: Palette.pureWhite,
              filled: false,
              counterText: "",
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                  color: Palette.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Palette.primary)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Palette.pureWhite)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.3)))),
        ));
  }
}
