import 'package:flutter/material.dart';

import 'ColorItems.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.hintText = "",
      this.textfieldIcon,
      this.iconColor = Colors.white,
      required this.controller,
      this.obscureText = false})
      : super(key: key);
  final double textfieldBorderWidth = 1;
  final String hintText;
  final IconData? textfieldIcon;
  final Color iconColor;
  final TextEditingController controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorItems.containerColor,
          borderRadius: _BorderRadious.circular30,
          boxShadow: [
            BoxShadow(
                spreadRadius: 7,
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              textfieldIcon,
              color: iconColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorItems.teftFieldBorderColor,
                    width: textfieldBorderWidth),
                borderRadius: _BorderRadious.circular30),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorItems.teftFieldBorderColor,
                    width: textfieldBorderWidth),
                borderRadius: _BorderRadious.circular30),
            border:
                OutlineInputBorder(borderRadius: _BorderRadious.circular30)),
      ),
    );
  }
}

class _BorderRadious {
  static final BorderRadius circular30 = BorderRadius.circular(30);
}
