// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:customer/design/views/history/admin/adHistory.dart';
import 'package:customer/design/views/home/admin/adhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../design/views/auth/signin/signin.dart';
import '../design/views/auth/signup/signup.dart';
import '../design/views/coupon/coupon.dart';
import '../design/views/history/history.dart';
import '../design/views/home/home.dart';
import '../design/views/payment/payment.dart';
import '../design/views/splash/splash.dart';
import '../design/views/status/status.dart';

class Routes {
  static const String splashView = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/Home';
  static const String payment = '/Payment';
  static const String status = '/Status';
  static const String coupon = '/Coupon';
  static const String history = '/History';
  static const String adhome = '/AdHome';
  static const String adhistory = '/AdHistory';
  static const all = <String>{
    splashView,
    signIn,
    signUp,
    home,
    payment,
    status,
    coupon,
    history,
    adhome,
    adhistory
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.signIn, page: SignIn),
    RouteDef(Routes.signUp, page: SignUp),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.payment, page: Payment),
    RouteDef(Routes.status, page: Status),
    RouteDef(Routes.coupon, page: Coupon),
    RouteDef(Routes.history, page: History),
    RouteDef(Routes.adhome, page: AdHome),
    RouteDef(Routes.adhistory, page: AdHistory),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    SignIn: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignIn(),
        settings: data,
      );
    },
    SignUp: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>  SignUp(),
        settings: data,
      );
    },
    Home: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>  Home(),
        settings: data,
      );
    },
    Payment: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => Payment(title: '',),
        settings: data,
      );
    },
    Status: (data) {
      var args = data.getArgs<StatusArguments>(
        orElse: () => StatusArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => Status(key: args.key),
        settings: data,
      );
    },
    Coupon: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const Coupon(),
        settings: data,
      );
    },
    History: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const History(),
        settings: data,
      );
    },
    AdHome: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>  AdHome(),
        settings: data,
      );
    },
    AdHistory: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>  AdHistory(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Status arguments holder class
class StatusArguments {
  final dynamic key;
  StatusArguments({this.key});
}
