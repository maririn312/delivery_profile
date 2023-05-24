import 'package:flutter/material.dart';

class MelonInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Widget child;
  final int maxLength;
  final int maxLines;
  final bool obscureText;
  final String errorText;
  final String labelText;
  final String hintText;
  final bool readOnly;
  final TextAlign textAlign;

  const MelonInput({
    Key key,
    this.controller,
    this.type,
    this.maxLength,
    this.obscureText = false,
    this.errorText,
    this.child,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double labelFontSize = 15;

    if (controller.text.isNotEmpty) {
      labelFontSize = 13;
    }

    Widget input = TextFormField(
      textAlign: textAlign,
      readOnly: readOnly,
      keyboardType: type,
      controller: controller,
      maxLength: maxLength,
      obscureText: obscureText,
      maxLines: maxLines,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xff1d1d1d)
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: const Color(0xffb5b8c2),
          fontSize: labelFontSize,
          fontWeight: FontWeight.w500,
          height: 3
        ),
        fillColor: const Color(0xfffbfcfd),
        filled: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.only(
          top: 18,
          bottom: 11,
          left: 16,
          right: 16
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Color(0xff8a8a8f)),
        errorText: errorText,
        errorStyle: const TextStyle(
          fontSize: 15,
          color: Color(0xffdfa5b3),
          fontWeight: FontWeight.w500,
        ),
        errorMaxLines: 5,
        counterText: '',
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Color(0xffd1d5db)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Color(0xff2DC62D)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color(0xffdfa5b3),
            width: 1.4
          ),
        )
      ),
    );
    return input;
  }
}
