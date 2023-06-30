import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/auth/base/authentication_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// ignore: implementation_imports
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import 'signin.form.dart';

class SignInViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  late String? isUserAdmin;

  // SignInViewModel() : super(successRoute: Routes.home);
  SignInViewModel({required super.successRoute});

  @override
  // ignore: missing_return
  Future<FirebaseAuthenticationResult> runAuthentication() async {
    
    //  _firebaseUser.logout();
    
  
    _firebaseAuthenticationService.loginWithEmail(
      email: emailValue,
      password: passwordValue,
    );

    // navigationService.replaceWith(Routes.adhome);

    isUserAdmin = await isAdmin();
    isUserAdmin.toString();

    print("i am a $isUserAdmin");

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
    
    throw Exception('something went wrong');
  }

  void navigateToCreateAccount() => navigationService.navigateTo(Routes.signUp);

}
