import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:customer/models/voucher.dart';
import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';

class CouponItem extends StatelessWidget {
  final Fuel fuel;

  const CouponItem({
    super.key,
    required this.fuel,
  });

  @override
  Widget build(BuildContext context) {
    // DateTime t = DateTime.parse(fuel.timestamp.toDate().toString());
    // String day = t.day.toString();

    // String time_00 = DateFormat.yMMMMd('en_US').format(t).toString();
    // String time_01 = DateFormat.jm().format(t).toString();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 230,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: kclightGreen),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Generated Token',
                        textAlign: TextAlign.center,
                        style: ktsXBigGreen,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, right: 30.0, left: 30.0, bottom: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              fuel.otp.toString(),
                              style: ktsBigGreen,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
