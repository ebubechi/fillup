import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/design/views/auth/base/user_viewmodel.dart';
import 'package:customer/models/voucher.dart';
import 'package:customer/services/function/firestore_services.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryViewModel extends UserViewModel {
  final navigationService = locator<NavigationService>();
  final FirestoreService firestoreService = locator<FirestoreService>();
// final DialogService _dialogService = locator<DialogService>();

  late List<Fuel> _fuels;
  // List<Fuel> get fuels => _fuels;

  String title = 'History';

  void navToHome() => navigationService.navigateTo(Routes.home);

  void navToCoupon() => navigationService.navigateTo(Routes.coupon);

  void navToHistory() => navigationService.navigateTo(Routes.history);

  void navBack() => navigationService.back();

  void listenToFuels() {
    setBusy(true);

    firestoreService.listenToFuelsRealTime(userID).listen((fuelsData) {
      List<Fuel> updatedfuels = fuelsData;
      if (updatedfuels.length > 0) {
        _fuels = updatedfuels;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  List<Fuel> get fuels => _fuels;
}
