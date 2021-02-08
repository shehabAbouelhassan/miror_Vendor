import 'package:Vendor_app/src/styles/base.dart';
import 'package:Vendor_app/src/styles/text.dart';
import 'package:Vendor_app/src/widgets/button.dart';
import 'package:Vendor_app/src/widgets/social_Buttons.dart';
import 'package:Vendor_app/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    } else {
      return Scaffold(
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/header.png'),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/logo.png')),
          ),
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Email',
          cupertinoIcon: CupertinoIcons.mail_solid,
          materialIcon: Icons.email,
          textInputType: TextInputType.emailAddress,
        ),
        AppTextField(
          isIOS: Platform.isIOS,
          hintText: 'Password',
          cupertinoIcon: IconData(0xf4c9,
              fontFamily: CupertinoIcons.iconFont,
              fontPackage: CupertinoIcons.iconFontPackage),
          materialIcon: Icons.lock,
          obscureText: true,
        ),
        AppButton(
          buttonText: "signup",
          buttonType: ButtonType.LightBlue,
        ),
        SizedBox(
          height: 6.0,
        ),
        Center(
          child: Text(
            'Or',
            style: TextStyles.suggestion,
          ),
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppSocialButton(
                socialType: SocialType.FaceBook,
              ),
              SizedBox(
                width: 15.0,
              ),
              AppSocialButton(socialType: SocialType.Google),
            ],
          ),
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Already Have an Account ?",
                style: TextStyles.body,
                children: [
                  TextSpan(
                      text: "Login",
                      style: TextStyles.link,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, '/login'))
                ]),
          ),
        )
      ],
    );
  }
}
