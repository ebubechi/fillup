import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/price_rate.dart';
import 'package:customer/models/user.dart';
import 'package:customer/models/voucher.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _fuelCollection =
      FirebaseFirestore.instance.collection('fuelBought');

  final CollectionReference _fuelRateCollection =
      FirebaseFirestore.instance.collection('fuelRate');

  final StreamController<List<Fuel>> _fuelController =
      StreamController<List<Fuel>>.broadcast();

  // final StreamController<List<FuelRate>> _fuelPriceController =
  //     StreamController<List<FuelRate>>.broadcast();

  Future createUser(Users user) async {
    try {
      await _usersCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUserRole(String uid) async {
    try {
      var userData = await _usersCollection.doc(uid).get();
      var usersRole = Users.fromData(userData.data());
      print("#### this is admin service ####");
      print(usersRole.userRole);
      return usersRole.userRole;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollection.doc(uid).get();
      var user = Users.fromData(userData.data());
      print("#### this is User service ####");
      print(user);
      return user.email;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future addFuel(Fuel fuel) async {
    try {
      await _fuelCollection.add(fuel.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream getFuelsOnceOff() {
    _fuelCollection
        .orderBy("timestamp", descending: true)
        .limit(1)
        .snapshots()
        .listen((fuelSnapshot) {
      if (fuelSnapshot.docs.isNotEmpty) {
        var fuel = fuelSnapshot.docs
            .map((snapshot) => Fuel.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.amount != null)
            .toList();

        _fuelController.add(fuel);
      }
    });
    return _fuelController.stream;
  }

  Stream listenToFuelsRealTime(userId) {
    _fuelCollection
        .orderBy("timestamp", descending: true)
        .where("userId", isEqualTo: userId)
        .snapshots()
        .listen((fuelSnapshot) {
      if (fuelSnapshot.docs.isNotEmpty) {
        var fuel = fuelSnapshot.docs
            .map((snapshot) => Fuel.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.amount != null)
            .toList();

        _fuelController.add(fuel);
      }
    });
    return _fuelController.stream;
  }

  Stream listenToFuelsRealTimeAdmin() {
    _fuelCollection
        .orderBy("timestamp", descending: true)
        .snapshots()
        .listen((fuelSnapshot) {
      if (fuelSnapshot.docs.isNotEmpty) {
        var fuel = fuelSnapshot.docs
            .map((snapshot) => Fuel.fromMap(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.amount != null)
            .toList();

        _fuelController.add(fuel);
      }
    });
    return _fuelController.stream;
  }

  Future updateFuelPrice(FuelRate fuelRate) async {
    try {
      await _fuelRateCollection.add(fuelRate.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future<int> getFuelPrice() async {
    DocumentSnapshot fuelprice = await _fuelRateCollection.doc('price').snapshots().last;
    String fprice = fuelprice.toString();
    print('this is fprice $fprice');
    int ffprice = int.parse(fprice);
    print('this is ffprice $ffprice');
    return ffprice;
  }
}
