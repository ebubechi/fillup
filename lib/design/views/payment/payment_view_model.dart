import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/auth/base/user_viewmodel.dart';
import 'package:customer/models/voucher.dart';
import 'package:customer/services/function/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otp/otp.dart';
import 'package:paystack_manager/paystack_manager.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class PaymentViewModel extends UserViewModel {
  final navigationService = locator<NavigationService>();
  final firebaseUser = locator<FirebaseAuthenticationService>();
  final firestoreService = locator<FirestoreService>();
  final firebaseAuth = FirebaseAuth.instance;

  void navToCoupon() => navigationService.navigateTo(Routes.coupon);

  String title = 'Pay to get token';

  get otpcode => _otpcode();

  DateTime now = DateTime.now();

  dynamic time = DateFormat.yMMMMd().format(DateTime.now()).toString();

  //  DateTime currentPhoneDate = DateTime.now(); //DateTime
  //  Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
  //  DateTime myDateTime = myTimeStamp.toDate();

  int _otpcode() {
    final code =
        OTP.generateTOTPCode("JBSWY3DPEHPK3PXP", now.millisecondsSinceEpoch);
    return code;
  }

  Future addFuel({@required double amount, @required double litre}) async {
    setBusy(true);

    await firestoreService.addFuel(Fuel(
        userId: userID,
        amount: amount,
        otp: otpcode,
        timestamp: time,
        ltr: litre));

    setBusy(false);
  }

  Future<void> processPaymentt(
      {BuildContext context,
      @required int amount,
      @required String email,
      @required String fullname}) async {
    try {
      PaystackPayManager(context: context)
        // Don't store your secret key on users device.
        // Make sure this is retrive from your server at run time
        ..setSecretKey("sk_test_a861a1f4cc0dcaad54b1fe2ecd7712d785e7e5f5")
        //accepts widget
        ..setCompanyAssetImage(Image(
          image: AssetImage("assets/images/logo.png"),
        ))
        ..setAmount(amount ?? 15000)
        // ..setReference("your-unique-transaction-reference")
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("NGN")
        ..setEmail(email)
        ..setFirstName(fullname)
        ..setMetadata(
          {
            "custom_fields": [
              {
                "value": "FillUp",
                "display_name": "Payment_to",
                "variable_name": "payment_to"
              }
            ]
          },
        )
        ..onSuccesful(_onPaymenttSuccessful)
        ..onPending(_onPaymenttPending)
        ..onFailed(_onPaymenttFailed)
        ..onCancel(_onPaymenttCancelled)
        ..initialize();
    } catch (error) {
      print("Paymentt Error ==> $error");
    }
    // navToCoupon();
  }

  void _onPaymenttSuccessful(Transaction transaction) {
    print("Transaction was successful");
    print("Transaction Message ===> ${transaction.message}");
    print("Transaction Refrence ===> ${transaction.refrenceNumber}");
    navToCoupon();
  }

  void _onPaymenttPending(Transaction transaction) {
    print("Transaction is pendinng");
    print("Transaction Refrence ===> ${transaction.refrenceNumber}");
  }

  void _onPaymenttFailed(Transaction transaction) {
    print("Transaction failed");
    print("Transaction Message ===> ${transaction.message}");
  }

  void _onPaymenttCancelled(Transaction transaction) {
    print("Transaction was cancelled");
  }
}
