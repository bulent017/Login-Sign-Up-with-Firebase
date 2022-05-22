import 'package:flutter/material.dart';
import 'package:simple_login/Core/ColorItems.dart';
import 'package:simple_login/auth_controller.dart';

import 'Core/Button.dart';
import 'Core/ImageItems.dart';
import 'Core/PaddingItems.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.email}) : super(key: key);
  final String buttonText = "Sign out";
  final String text = "Welcome";
  final String? email;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SignImage(
              imageName: ImageItems.signUpImage,
              w: w,
              h: h,
              circularImageName: ImageItems.profil1Image,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: w,
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                  Text(
                    email!,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: PaddngItems.verticalPadding,
                child: Button(
                    onpressed: () {
                      AuthController.instance.logOut();
                    },
                    buttonText: buttonText,
                    imageName: ImageItems.loginButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignImage extends StatelessWidget {
  const _SignImage(
      {Key? key,
      required this.imageName,
      required this.w,
      required this.h,
      required this.circularImageName})
      : super(key: key);
  final String imageName;
  final double w;
  final double h;
  final String circularImageName;

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.4,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(_path))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: ColorItems.SignUpCircleAvatarColor,
            radius: 60,
            backgroundImage: AssetImage(_path2),
          )
        ],
      ),
    );
  }

  String get _path => "assets/images/$imageName.png";
  String get _path2 => "assets/images/$circularImageName.png";
}

class InformationText extends StatelessWidget {
  const InformationText({Key? key, required this.informationText})
      : super(key: key);
  final String informationText;
  @override
  Widget build(BuildContext context) {
    return Text(
      informationText,
      style: Theme.of(context)
          .textTheme
          .headline2
          ?.copyWith(color: ColorItems.informationTextColor, fontSize: 15),
    );
  }
}
