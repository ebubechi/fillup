import 'package:flutter/foundation.dart';

class Fuel {
  final double amount;
  final double ltr;
  final int otp;
  final dynamic timestamp;
  final String userId;
  final String documentId;

  Fuel(
      {@required this.userId,
      @required this.amount,
      @required this.ltr,
      @required this.timestamp,
      @required this.otp,
      this.documentId});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'amount': amount,
      'ltr': ltr,
      'timestamp': timestamp,
      'otp': otp,
    };
  }

  static Fuel fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Fuel(
        amount: map['amount'],
        ltr: map['ltr'],
        otp: map['otp'],
        userId: map['userId'],
        timestamp: map['timestamp'],
        documentId: map['documentId']);
  }
}
