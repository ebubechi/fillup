import 'package:flutter/foundation.dart';

class FuelRate {
  final double amountPerLitre;
  final dynamic timeStamp;
  final String userId;
  final String documentId;

  FuelRate(
    { @required this.userId,
      @required this.amountPerLitre,
      @required this.timeStamp,
      this.documentId});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'amount': amountPerLitre,
      'timestamp': timeStamp,
    };
  }

  static FuelRate fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return FuelRate(
        amountPerLitre: map['amountPerLitre'],
        userId: map['userId'],
        timeStamp: map['timeStamp'],
        documentId: map['documentId']);
  }
}
