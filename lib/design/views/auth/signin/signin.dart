import 'package:customer/design/shared/authentication_layout.dart';
import 'package:customer/design/views/auth/signin/signin_view_model.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin.form.dart';
import 'signin_view_model.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignIn extends StatelessWidget with $SignInView {
  SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
            backgroundColor: kcdeepBlack,
            body: AuthenticationLayout(
              busy: model.isBusy,
              onMainButtonTapped: model.saveData,
              onCreateAccountTapped: model.navigateToCreateAccount,
              validationMessage: model.validationMessage,
              title: 'SIGN IN',
              subtitle: '',
              mainButtonTitle: 'SIGN IN',
              minorButtonTitle: 'SIGN UP',
              form: Column(
                children: [
                  TextField(
                    style: ktsMediumWhite,
                    decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: kcdeepGreen)),
                    controller: emailController,
                  ),
                  TextField(
                    obscureText: true,
                    style: ktsMediumWhite,
                    decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: kcdeepGreen)),
                    controller: passwordController,
                  ),
                ],
              ),
              onMinorButtonTapped: model.navigateToCreateAccount,
              onForgotPassword: () {},
            )),
        viewModelBuilder: () => SignInViewModel());
  }
}
