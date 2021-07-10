import 'package:customer/design/views/auth/signin/signin.dart';
import 'package:customer/design/views/auth/signup/signup.dart';
import 'package:customer/design/views/coupon/coupon.dart';
import 'package:customer/design/views/history/admin/adHistory.dart';
import 'package:customer/design/views/history/history.dart';
import 'package:customer/design/views/home/admin/adhome.dart';
import 'package:customer/design/views/home/home.dart';
import 'package:customer/design/views/payment/payment.dart';
import 'package:customer/design/views/splash/splash.dart';
import 'package:customer/design/views/status/status.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    CupertinoRoute(page: SignIn),
    CupertinoRoute(page: SignUp),
    CupertinoRoute(page: Home),
    CupertinoRoute(page: Payment),
    CupertinoRoute(page: Status),
    CupertinoRoute(page: Coupon),
    CupertinoRoute(page: History),
    CupertinoRoute(page: AdHome),
    CupertinoRoute(page: AdHistory),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}