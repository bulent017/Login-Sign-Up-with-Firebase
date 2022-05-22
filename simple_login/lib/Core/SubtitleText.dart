import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline2?.copyWith(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[500]),
    );
  }
}
