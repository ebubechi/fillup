import 'package:customer/design/shared/authentication_layout.dart';
import 'package:customer/design/views/auth/signup/signup_view_model.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';

// import 'package:customer/ui/dumb_widgets/authentication_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup.form.dart';
import 'signup_view_model.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUp extends StatelessWidget with $SignUpView {
  SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ['Buyer', 'Seller',];
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcdeepBlack,
          body: AuthenticationLayout(
        busy: model.isBusy,
        onMainButtonTapped: model.saveData,
        onBackPressed: model.navigateBack,
        validationMessage: model.validationMessage,
        title: 'Sign Up',
        subtitle: '',
        mainButtonTitle: 'SIGN UP',
        minorButtonTitle: 'SIGN IN',
        form: Column(
          children: [
            TextField(
              style: ktsMediumWhite,
              decoration: InputDecoration(labelText: 'Full Name', labelStyle: TextStyle(color: kcdeepGreen, fontSize: 12)),
              controller: fullNameController,
            ),
            TextField(
              style: ktsMediumWhite,
              decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: kcdeepGreen, fontSize: 12)),
              controller: emailController,
            ),
            TextField(
              obscureText: true,
              style: ktsMediumWhite,
              decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: kcdeepGreen, fontSize: 12)),
              controller: passwordController,
            ),
           new Theme(
             data: Theme.of(context).copyWith(
             canvasColor: kcbackgroudColor,
            ),
             child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    readOnly: true,
                    style: ktsMediumWhite,
                    decoration: InputDecoration(labelText: 'User-Type', labelStyle: TextStyle(color: kcdeepGreen, fontSize: 12)),
                    controller: dropdownController,
                    )
                ),
                new PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                  onSelected: (String value) {
                    dropdownController.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return items.map<PopupMenuItem<String>>((String value) {
                      return new PopupMenuItem(child: new Text(value, style: ktsMediumGreen,), value: value);
                    }).toList();
                  },
                ),
              ],
          ),
           ),
          ],
        ),
        onMinorButtonTapped: model.navigateBack,
        showTermsText: true,
      )),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
