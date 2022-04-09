import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:friends_khata/home/domain/home_failures.dart';

import '../domain/user.dart';

class HomeRepository {
  final FirebaseFirestore _firebaseFirestore;

  HomeRepository(this._firebaseFirestore);

  Future<Either<HomeFailures, Unit>> addUser(User user) async {
    try {
      await _firebaseFirestore.collection("users").add({
        "name": user.name,
        "age": user.age,
      });
      return right(unit);
    } on PlatformException {
      return left(const HomeFailures.unexpected());
    }
    // cast(e) {
    //   return left(const HomeFailures.unableToAddUser());
    // }
  }
}
