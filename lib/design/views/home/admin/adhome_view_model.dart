import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/payment/payment_view_model.dart';
import 'package:customer/models/price_rate.dart';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class AdHomeViewModel extends PaymentViewModel {
  String title = 'Pay to get token';
  DateTime timeStamp = DateTime.now();

  final dialogService = locator<DialogService>();

  void navToHome() => navigationService.navigateTo(Routes.adhome);

  void navToCoupon() => navigationService.navigateTo(Routes.coupon);

  void navToPayment() => navigationService.navigateTo(Routes.payment);

  void navToHistory() => navigationService.navigateTo(Routes.adhistory);

  void navBack() => navigationService.back();

  // Future<dynamic> getUser() => firestoreService.getUser(userID);

  Future updateFuelPrice({@required double amountPerLitre}) async {
    setBusy(true);

    FuelRate pricedetail = FuelRate(
        userId: userID, amountPerLitre: amountPerLitre, timeStamp: timeStamp);

    await firestoreService.updateFuelPrice(pricedetail);
  }

  void logout() async {
    await firebaseUser.logout();
    var U = userID;
    print("this user $U is signed out");
    navigationService.replaceWith(Routes.signIn);
  }
}
