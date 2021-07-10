// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AmountValueKey = 'amount';
const String LitresValueKey = 'litres';

mixin $HomeView on StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController litresController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();
  final FocusNode litresFocusNode = FocusNode();

  // String amtFuel = amountController.text;

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));
    litresController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        {
          AmountValueKey: amountController.text,
          LitresValueKey: litresController.text,
        },
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    amountController.dispose();
    litresController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String get amountValue => this.formValueMap[AmountValueKey];
  String get litresValue => this.formValueMap[LitresValueKey];
}
