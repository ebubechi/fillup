import 'package:customer/app/app.locator.dart';
import 'package:customer/services/function/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();

  // final _firebaseAuthenticationService =
  //   locator<FirebaseAuthenticationService>();

  final _firestoreServices = locator<FirestoreService>();
  final _firebaseAuth = FirebaseAuth.instance;

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());

    if (!result.hasError) {
      // navigate to success route
      navigationService.replaceWith(successRoute);
    } else {
      setValidationMessage(result.errorMessage);
    }
  }

  Future<String> isAdmin() async {
    print("**** The admin model is Loading... ****");
    String myUser = await _firestoreServices.getUserRole(userID!);
    return myUser.toString();

    // print("**** This is admin model user ****");
    // print('==> $myUser ===> this is the user object');
    // if (myUser != null && myUser == "Seller") {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  String? get userID {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<FirebaseAuthenticationResult> runAuthentication();
}
