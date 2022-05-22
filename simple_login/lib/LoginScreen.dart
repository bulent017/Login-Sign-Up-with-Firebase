import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_login/Core/ColorItems.dart';
import 'package:simple_login/Core/IconItems.dart';
import 'package:simple_login/auth_controller.dart';

import 'Core/Button.dart';
import 'Core/ImageItems.dart';
import 'Core/PaddingItems.dart';
import 'Core/PngImageWidget.dart';
import 'Core/SubtitleText.dart';
import 'Core/TextFieldWidget.dart';
import 'Core/TitleTextWidget.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String title = "Hello";

  final String subtitle = "Sign into your account";

  final String forgotPassword = "Forgot your Password ?";

  final String buttonText = "SIGN IN";

  final String informationText = "Don't have an account?";

  final String informationText2 = "  Create";

  final String emailHintText = "Email";

  final String passwordHintText = "Password";

  //double w = MediaQuery.of(context).size.width;
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
            PngImage(
              imageName: ImageItems.loginImage,
              w: w,
              h: h,
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(title: title),
                  SubtitleText(title: subtitle),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: PaddngItems.verticalPadding,
                    child: TextFieldWidget(
                        controller: emailController,
                        hintText: emailHintText,
                        iconColor: ColorItems.textfieldIconColor,
                        textfieldIcon: IconItems.eMailIcon),
                  ),
                  Padding(
                    padding: PaddngItems.verticalPadding,
                    child: TextFieldWidget(
                        obscureText: true,
                        controller: passwordController,
                        hintText: passwordHintText,
                        textfieldIcon: IconItems.passwordIcon,
                        iconColor: ColorItems.textfieldIconColor),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      TextButton(
                          onPressed: () {},
                          child: SubtitleText(
                            title: forgotPassword,
                          ))
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: PaddngItems.verticalPadding,
                      child: Button(
                          onpressed: () {
                            AuthController.instance.login(
                                emailController.text.trim(),
                                passwordController.text.trim());
                          },
                          buttonText: buttonText,
                          imageName: ImageItems.loginButton),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: PaddngItems.verticalPadding,
                      child: _RichTextWidget(
                        informationCreateText: informationText2,
                        informationText: informationText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BorderRadious {
  static final BorderRadius circular30 = BorderRadius.circular(30);
}

class _RichTextWidget extends StatelessWidget {
  const _RichTextWidget(
      {Key? key,
      required this.informationText,
      required this.informationCreateText})
      : super(key: key);
  final String informationText;
  final String informationCreateText;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: informationText,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[500]),
            children: [
          TextSpan(
              text: informationCreateText,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.to(() => SignupScreen()))
        ]));
  }
}
