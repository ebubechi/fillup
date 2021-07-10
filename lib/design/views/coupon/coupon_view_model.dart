import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/models/voucher.dart';
import 'package:customer/services/function/firestore_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CouponViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final FirestoreService firestoreService = locator<FirestoreService>();
// final DialogService _dialogService = locator<DialogService>();

  List<Fuel> _fuels;
  List<Fuel> get fuels => _fuels;

  String title = 'Generated Token';

   void navToHome() {
    navigationService.navigateTo(Routes.home);
  }

  void navToCoupon() {
    navigationService.navigateTo(Routes.coupon);
  }

  void navToHistory() {
    navigationService.navigateTo(Routes.history);
  }


  void navBack() {
    navigationService.back();
  }


  void getFuels() {
   setBusy(true);

    firestoreService.getFuelsOnceOff().listen((fuelsData) {
      List<Fuel> updatedfuels = fuelsData;
      if (updatedfuels != null && updatedfuels.length > 0) {
        _fuels = updatedfuels;
        notifyListeners();
      }

      setBusy(false);
    });

   setBusy(false);
 }
}
