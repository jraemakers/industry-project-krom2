import 'package:flutter/material.dart';

class diary_input_field extends StatelessWidget {
  diary_input_field({
    this.inputFieldColor,
    this.borderRadius,
    this.maxLines,
    this.hintText,
    required this.label,
    super.key,
  });
  String label;
  Color? inputFieldColor;
  double? borderRadius;
  int? maxLines;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: TextStyle(fontSize: 16.0),
      ),
      Container(
        child: TextField(
          maxLines: maxLines ?? 1,
          //TODO: define input controller for title
          //BUG: label not working as needed
          //FIXME: customise input field
          //HACK: Used text as input field label
          decoration: InputDecoration(
            filled: true,
            fillColor: inputFieldColor ?? Colors.white,
            hintText: 'Type here...',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 185, 180, 180),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          ),
        ),
      ),
    ]);
  }
}
