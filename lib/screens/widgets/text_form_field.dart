import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.controller,
    this.obscureText,
    this.focusNode,
    this.onTapOutside,
    this.onSaved,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onTapOutside: onTapOutside,
        onSaved: onSaved,
        cursorColor: ColorPicker.colorScheme1,
        obscureText: obscureText ?? false,
        style: const TextStyle(
            color: ColorPicker.colorScheme1, decorationThickness: 0),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          labelStyle: const TextStyle(
            fontSize: 15,
          ),
          hintStyle: const TextStyle(
            color: ColorPicker.colorScheme4,
          ),
          fillColor: Colors.white,
          filled: true,
          errorStyle: const TextStyle(
            color: ColorPicker.colorScheme1,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: textInputBorder(),
          focusedBorder: textInputBorder(),
          errorBorder: textInputBorder(),
          focusedErrorBorder: textInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder textInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      );
}
