import 'package:flutter/material.dart';

class PngImage extends StatelessWidget {
  const PngImage(
      {Key? key, required this.imageName, required this.w, required this.h})
      : super(key: key);
  final String imageName;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.4,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(_path))),
    );
  }

  String get _path => "assets/images/$imageName.png";
}
