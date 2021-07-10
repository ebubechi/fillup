// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';
const String DropdownValueKey = 'User-Type';

mixin $SignUpView on StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dropdownController = TextEditingController();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    dropdownController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        {
          FullNameValueKey: fullNameController.text,
          EmailValueKey: emailController.text,
          PasswordValueKey: passwordController.text,
          DropdownValueKey: dropdownController.text,
        },
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dropdownController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String get fullNameValue => this.formValueMap[FullNameValueKey];
  String get emailValue => this.formValueMap[EmailValueKey];
  String get passwordValue => this.formValueMap[PasswordValueKey];
  String get dropdownValue => this.formValueMap[DropdownValueKey];
}
