import 'package:customer/design/views/coupon/coupon_view_model.dart';
import 'package:customer/design/widgets/coupon.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CouponViewModel>.nonReactive(
      onModelReady: (model) => model.getFuels(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: kcdeepBlack,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: kcdeepBlack,
                title: Text(
                  model.title,
                  style: ktsBigWhite,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kcdeepGreen,
                  ),
                  onPressed: () {
                    model.navBack();
                  },
                ),
              ),
              body: Container(
              height: double.infinity,
              width: double.infinity,
              color: kcdeepBlack,
              child:(model.fuels == null)
                  ? Center(
                      child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  // Theme.of(context).primaryColor
                                  Colors.white),
                            ))
                  : Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: ListView.builder(
                        itemCount: model.fuels.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CouponItem(
                                fuel: model.fuels[index],
                              ),
                        )),
                  ),
            )),
        viewModelBuilder: () => CouponViewModel());
  }
}
