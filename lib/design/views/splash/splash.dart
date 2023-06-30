import 'dart:ui';
import 'package:customer/design/views/splash/splash_view_model.dart';
import 'package:customer/design/widgets/drawstraight_line.dart';
import 'package:customer/design/widgets/ripple_effect.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
      backgroundColor: kcdeepBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0, top: 18.0),
                child: CustomPaint(
                  painter: Drawhorizontalline(sized: size),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width,
                      // color: Colors.deepPurpleAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: CustomPaint(
                              painter: Drawverticalline(sized: size)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: CustomPaint(painter: Drawverticalline2(sized: size)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 130.0,
                        left: 30.0,
                      ),
                      child: SizedBox(
                          width: 80,
                          height: 100,
                          child: Image.asset('assets/images/logo.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 150.0,
                        right: 50.0,
                      ),
                      child: Text(
                        'Fast and seamless gas purchase',
                        textAlign: TextAlign.center,
                        style: ktsBigWhite,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 80.0,
                        right: 90.0,
                      ),
                      child: RipplesAnimation(
                        child: Container(),
                        color: kcdeepGreen,
                        size: 20,
                        onPressed: model.doSomething,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ), viewModelBuilder: () => SplashViewModel(),);
  }
}
