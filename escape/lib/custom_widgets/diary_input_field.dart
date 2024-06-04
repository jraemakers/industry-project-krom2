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

  final String label;
  final Color? inputFieldColor;
  final double? borderRadius;
  final int? maxLines;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 6.0),
        TextField(
          style: TextStyle(color: Color(0xFFCBCBCB)),
          maxLines: maxLines ?? 1,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: inputFieldColor ?? Color.fromRGBO(0, 81, 116, 1),
            hintText: hintText ?? '',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 185, 180, 180),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(80, 153, 185, 0.33),
                width: 1.0, // Thin border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 255, 255, 255),
                width: 1.0,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ],
    );
  }
}
