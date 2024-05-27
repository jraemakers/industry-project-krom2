import 'package:flutter/material.dart';

class DiaryInputField extends StatelessWidget {
  DiaryInputField({
    this.inputFieldColor,
    this.borderRadius,
    this.maxLines,
    this.hintText,
    required this.label,
    this.controller,
    super.key,
  });
  String label;
  Color? inputFieldColor;
  double? borderRadius;
  int? maxLines;
  String? hintText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16.0,
          // color: Colors.white,
        ),
      ),
      Container(
        child: TextField(
          maxLines: maxLines ?? 1,
          controller: controller,
          //BUG: label not working as needed
          //HACK: Used text as input field label
          decoration: InputDecoration(
            filled: true,
            fillColor: inputFieldColor ?? Colors.white,
            hintText: '...',
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 185, 180, 180),
                fontWeight: FontWeight.w300,
                fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                borderSide: BorderSide.none),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ),
    ]);
  }
}
