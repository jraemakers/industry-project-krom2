import 'package:flutter/material.dart';

class trigger_button extends StatelessWidget {
  trigger_button({
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
      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
      child: Container(
        width: 90,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                buttonColor ?? Color.fromARGB(255, 139, 185, 222)),
            //FIXME: Remove depricated features and find new way for MaterialStateProperty
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          onPressed: () {}, //TODO: implement onPressed method and call
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                buttonText,
                style: TextStyle(color: textColor ?? Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
