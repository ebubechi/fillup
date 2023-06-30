// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedGetItGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:customer/services/function/firestore_services.dart';
// import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerSingleton(FirebaseAuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
