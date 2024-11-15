// import 'package:bellaryapp/common/widgets/text.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../../common/widgets/dropdown.dart';
// import '../../../constants/size_unit.dart';
// import '../../../theme/palette.dart';

// class Dropdowncustomstyle extends StatefulWidget {
//   Dropdowncustomstyle({
//     super.key,
//     required this.selectedvalue,
//     required this.data,
//     //  this.nav,
//   });
//   String selectedvalue;
//   final List data;
//   // String? nav = "";

//   @override
//   State<Dropdowncustomstyle> createState() => _DropdowncustomstyleState();
// }

// class _DropdowncustomstyleState extends State<Dropdowncustomstyle> {
//   @override
//   Widget build(BuildContext context) {
//     return DropDownCustom(
//       value: widget.selectedvalue,
//       isFilled: true,
//       items: widget.data.map((e) {
//         if (e == widget.selectedvalue) {
//           return DropdownMenuItem(
//               value: e,
//               child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextCustom(e),
//                     const Icon(
//                       Icons.check,
//                       color: Palette.primary,
//                     ),
//                   ]));
//         } else {
//           return DropdownMenuItem(
//             value: e,
//             child: TextCustom(e),
//           );
//         }
//       }).toList(),
//       isNoBorder: false,
//       contentPadding: const EdgeInsets.fromLTRB(
//           SizeUnit.lg, SizeUnit.lg, SizeUnit.sm, SizeUnit.lg),
//       onChanged: (newValue) => setState(() {
//         widget.selectedvalue = newValue.toString();
//         // if (widget.nav != "") {
//         //   context.push(widget.nav!);
//         // }
//         //  return;
//       }),
//     );
//   }
// }
