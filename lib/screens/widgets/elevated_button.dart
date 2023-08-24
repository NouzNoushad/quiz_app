import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color? overlayColor;
  final Color textColor;
  final void Function()? onPressed;
  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonColor,
      this.overlayColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: contextSize(context).height * 0.07,
      width: contextSize(context).width * 0.8,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return overlayColor ?? buttonColor;
                }
                return buttonColor;
              }),
              backgroundColor: MaterialStateProperty.all(buttonColor)),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          )),
    );
  }
}
