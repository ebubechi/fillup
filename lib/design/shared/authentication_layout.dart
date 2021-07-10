import 'dart:ui';

import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:customer/style/ui_helpers.dart';
import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final String minorButtonTitle;
  final Widget form;
  final bool showTermsText;
  final Function onMainButtonTapped;
  final Function onMinorButtonTapped;
  final Function onCreateAccountTapped;
  final Function onForgotPassword;
  final Function onBackPressed;
  final String validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key key,
    this.title,
    this.subtitle,
    this.mainButtonTitle,
    this.minorButtonTitle,
    this.form,
    this.onMainButtonTapped,
    this.onMinorButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.validationMessage,
    this.showTermsText = false,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          // if (onBackPressed == null) verticalSpaceLarge,
          // if (onBackPressed != null) verticalSpaceRegular,
          // if (onBackPressed != null)
          //   IconButton(
          //     padding: EdgeInsets.zero,
          //     alignment: Alignment.centerLeft,
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.black,
          //     ),
          //     onPressed: onBackPressed,
          //   ),
          verticalSpaceLarge,
          Container(
            height: 100,
            width: 50,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 34,
                  color: kcgreenTextColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.7),
              child: Text(
                subtitle,
                style: ktsMediumGreen,
              ),
            ),
          ),
          verticalSpaceRegular,
          form,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: onForgotPassword,
                  child: Text(
                    'Forget Password?',
                    style: ktsMediumWhite.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage,
              style: TextStyle(
                color: Colors.red,
                fontSize: kBodyTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kclight2Green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(
                      mainButtonTitle,
                      style: ktsBigBlack,
                    ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped == null)
            GestureDetector(
              onTap: onMinorButtonTapped,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kclight2Green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  minorButtonTitle,
                  style: ktsBigBlack,
                ),
              ),
            ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: kcwhite),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: kcdeepGreen,
                    ),
                  )
                ],
              ),
            ),
          if (showTermsText)
            Text(
              'By signing up you agree to our terms, conditions and privacy policy.',
              style: ktsSmallWhite,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
