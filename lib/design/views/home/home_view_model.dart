import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/payment/payment_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class HomeViewModel extends PaymentViewModel {
  String title = 'Pay to get token';

  void navToHome() => navigationService.navigateTo(Routes.home);

  void navToCoupon() => navigationService.navigateTo(Routes.coupon);

  void navToPayment() => navigationService.navigateTo(Routes.payment);

  void navToHistory() => navigationService.navigateTo(Routes.history);

  void navBack() => navigationService.back();

  Future<int> adminFuelRate() async {
    int price = await firestoreService.getFuelPrice();
    print('this is model price $price');
    return price;
  }

  void logout() async {
    await firebaseUser.logout();
    var U = userID;
    print("this user $U is signed out");
    navigationService.replaceWith(Routes.signIn);
  }
}
