import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/auth/base/authentication_viewmodel.dart';
import 'package:customer/services/function/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:customer/ui/base/authentication_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// ignore: implementation_imports
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import 'package:customer/models/user.dart';
import 'signup.form.dart';

class SignUpViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final _firestoreServices = locator<FirestoreService>();
  final _firebaseAuth = FirebaseAuth.instance;

  String isUserAdmin;

  SignUpViewModel() : super(successRoute: Routes.adhome);

  @override
  // ignore: missing_return
  Future<FirebaseAuthenticationResult> runAuthentication() async {
    await _firebaseAuthenticationService.createAccountWithEmail(
      email: emailValue,
      password: passwordValue,
    );
    createUserCollection();
    isUserAdmin = await isAdmin();
    isUserAdmin.toString();
    print("i am a $isUserAdmin");
    // if (isUserAdmin == "Seller") {
    //   navigationService.navigateTo(Routes.adhome);
    // } else {
    //   navigationService.navigateTo(Routes.home);
    // }

    switch (isUserAdmin) {
      case "Seller":
        navigationService.replaceWith(Routes.adhome);
        break;
      case "Buyer":
        navigationService.replaceWith(Routes.home);
        break;
      default:
        throw("no such user!");
    }
  }

  // bool isAdmin(userId) {
  //   dynamic myUser = _firestoreServices.getUser(userID);
  //   if (myUser != null && myUser == "Buyer") {
  //     return true;
  //   }
  //   return false;
  // }

  String get userID {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<void> createUserCollection() async {
    await _firestoreServices.createUser(Users(
        id: userID,
        fullName: fullNameValue,
        email: emailValue,
        userRole: dropdownValue));
  }

  void navigateBack() => navigationService.back();
}
