import 'package:flutter/material.dart';

class TriggerButton extends StatelessWidget {
  TriggerButton({
    required this.onPressed,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    required this.buttonText,
    this.icon,
    super.key,
  });
  VoidCallback onPressed;
  Color? buttonColor;
  double? borderRadius;
  Color? textColor;
  String buttonText;
  IconData? icon;
//TODO: connect all atrributes of the custom button now its only text and colors
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 10.0),
      child: Container(
        width: 80,
        height: 80,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(2),
            backgroundColor: MaterialStateProperty.all<Color>(
              buttonColor ?? Color(0xFF0F6C95),
            ),

            //FIXME: Remove depricated features and find new way for MaterialStateProperty
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Color(0xFFFEA655),
                size: 19,
              ),
              Text(
                buttonText,
                style:
                    TextStyle(color: textColor ?? Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
