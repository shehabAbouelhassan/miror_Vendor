import 'package:Vendor_app/src/blocs/auth_bloc.dart';
import 'package:Vendor_app/src/styles/base.dart';
import 'package:Vendor_app/src/styles/text.dart';
import 'package:Vendor_app/src/widgets/button.dart';
import 'package:Vendor_app/src/widgets/social_Buttons.dart';
import 'package:Vendor_app/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../styles/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: pageBody(context, authBloc),
      );
    } else {
      return Scaffold(
        body: pageBody(context, authBloc),
      );
    }
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
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
        StreamBuilder<String>(
            stream: authBloc.email,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Email',
                cupertinoIcon: CupertinoIcons.mail_solid,
                materialIcon: Icons.email,
                textInputType: TextInputType.emailAddress,
                errorText: snapshot.error,
                onChanged: authBloc.changeEmail,
              );
            }),
        StreamBuilder<String>(
            stream: authBloc.password,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Password',
                cupertinoIcon: IconData(0xf4c9,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage),
                materialIcon: Icons.lock,
                obscureText: true,
                errorText: snapshot.error,
                onChanged: authBloc.changePassword,
              );
            }),
        AppButton(
          buttonText: "Login",
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
                text: "Don't have an account ?",
                style: TextStyles.body,
                children: [
                  TextSpan(
                      text: "Signup",
                      style: TextStyles.link,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, '/signup'))
                ]),
          ),
        )
      ],
    );
  }
}
