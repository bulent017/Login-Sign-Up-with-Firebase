import 'package:flutter/material.dart';

import 'ColorItems.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({Key? key, this.buttonTitle}) : super(key: key);
  final buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      buttonTitle,
      style: Theme.of(context).textTheme.headline4?.copyWith(
          color: ColorItems.containerColor,
          fontWeight: FontWeight.bold,
          fontSize: 25),
    );
  }
}
