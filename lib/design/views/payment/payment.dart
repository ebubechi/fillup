import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paystack Paymentt"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //initiate paymentt button
            // ElevatedButton(
            //   // onPressed: _processPaymentt,
            //   child: Text(
            //     "Pay",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

}