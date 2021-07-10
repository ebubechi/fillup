import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/style/colors/colors.dart';
import 'package:customer/style/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:customer/models/voucher.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class FuelItem extends StatelessWidget {
  final Fuel fuel;
  final model;

  const FuelItem({Key key, this.fuel, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time_001 = fuel.timestamp;
    // print(time_001);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  time_001 ?? "time",
                  style: ktsMediumWhite,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: kcdeepBlack,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            child: Icon(
                              Icons.book,
                              color: kcdeepGreen,
                            ),
                            decoration: BoxDecoration(
                                color: kclight2Green,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      ]),
                      Column(children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Generated token',
                                style: ktsMediumWhite,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fuel.otp.toString() ?? "time",
                                style: ktsSmallWhite,
                              ),
                            )
                          ],
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            fuel.amount.toString() ?? "amount",
                            style: ktsMediumWhite,
                          ),
                        )
                      ]),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
