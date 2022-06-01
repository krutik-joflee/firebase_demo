// ignore_for_file: avoid_print, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/user_model.dart';

abstract class UserCollectionRepo {
  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> addUser({required MyUser user}) {
    return userCollection
        .add(user.toJson())
        // ignore: avoid_print
        .then((value) => print("User Added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<List<QueryDocumentSnapshot>> getUsers() async {
    final userData = await userCollection.get();

    for (var doc in userData.docs) {
      print("${doc.id} => ${doc.data()}");
    }
    return userData.docs;
  }
}
