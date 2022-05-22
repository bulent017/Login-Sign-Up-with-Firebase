import 'package:flutter/material.dart';

import 'ButtonText.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.buttonText,
      required this.imageName,
      required this.onpressed})
      : super(key: key);
  final String buttonText;
  final String imageName;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: w * 0.5,
        height: h * 0.08,
        decoration: BoxDecoration(
            borderRadius: _BorderRadious.circular30,
            image:
                DecorationImage(image: AssetImage(_path), fit: BoxFit.cover)),
        child: Center(child: ButtonText(buttonTitle: buttonText)),
      ),
    );
    ;
  }

  String get _path => "assets/images/$imageName.png";
}

class _BorderRadious {
  static final BorderRadius circular30 = BorderRadius.circular(30);
}
