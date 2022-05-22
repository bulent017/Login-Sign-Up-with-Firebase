import 'package:flutter/material.dart';
import 'package:simple_login/Core/ColorItems.dart';
import 'package:simple_login/Core/IconItems.dart';
import 'package:simple_login/LoginScreen.dart';
import 'package:simple_login/auth_controller.dart';

import 'Core/Button.dart';
import 'Core/ImageItems.dart';
import 'Core/PaddingItems.dart';
import 'Core/TextFieldWidget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String buttonText = "Sign up";

  final String informationText = "Sign up using on the following method";

  final String emailHintText = "Email";

  final String passwordHintText = "Password";

  //final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //var emailController = TextEditingController();
    //var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _SignImage(
                  imageName: ImageItems.signUpImage,
                  w: w,
                  h: h,
                  circularImageName: ImageItems.profil1Image,
                ),
                Positioned(
                    top: 30,
                    left: 5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: PaddngItems.verticalPadding,
              child: Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: PaddngItems.verticalPadding,
                      child: TextFieldWidget(
                          controller: emailController,
                          textfieldIcon: IconItems.eMailIcon,
                          iconColor: ColorItems.textfieldIconColor,
                          hintText: emailHintText),
                    ),
                    Padding(
                      padding: PaddngItems.verticalPadding,
                      child: TextFieldWidget(
                          controller: passwordController,
                          textfieldIcon: IconItems.passwordIcon,
                          iconColor: ColorItems.textfieldIconColor,
                          hintText: passwordHintText),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Padding(
                        padding: PaddngItems.verticalPadding,
                        child: Button(
                            onpressed: () {
                              AuthController.instance.register(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                              print("girdi");
                              print(emailController.toString());
                            },
                            buttonText: buttonText,
                            imageName: ImageItems.loginButton),
                      ),
                    ),
                    Padding(
                      padding: PaddngItems.verticalPadding15,
                      child: Center(
                          child: InformationText(
                        informationText: informationText,
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: PaddngItems.allPadding8,
                          child: ImageSocialMedia(imageName: ImageItems.g),
                        ),
                        Padding(
                          padding: PaddngItems.allPadding8,
                          child: ImageSocialMedia(imageName: ImageItems.f),
                        ),
                        Padding(
                          padding: PaddngItems.allPadding8,
                          child: ImageSocialMedia(imageName: ImageItems.t),
                        ),
                      ],
                    )
                  ],
                ),
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

class ImageSocialMedia extends StatelessWidget {
  const ImageSocialMedia({Key? key, required this.imageName}) : super(key: key);
  final String imageName;
  final double circle1Border = 30;
  final double circle2Border = 25;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circle1Border,
      backgroundColor: ColorItems.circleAvatarBorderSocialMediaColor,
      child: CircleAvatar(
        radius: circle2Border,
        backgroundImage: AssetImage(_path),
      ),
    );
  }

  String get _path => "assets/images/$imageName.png";
}
