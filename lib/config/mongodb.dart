import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongodb_test/config/enrironment.dart';
import 'package:mongodb_test/models/categories.model.dart';

class DataBase {
  static dynamic db, userCollection;
  static connect() async {
    db = await Db.create(Env.uri);
    await db.open();
    inspect(db);
    userCollection = db.collection(Env.collection);
  }

  static Future<List<Map<String, dynamic>>> fetchData() async {
    final dataList = await userCollection.find().toList();
    return dataList;
  }

  static Future<dynamic> insert(Categories data) async {
    try {
      var result = userCollection.insertOne(data.toJson());
      if (result) {
        return 'Data inserted successfully';
      } else {
        return 'Something wrong with date insertion';
      }
    } catch (exception) {
      debugPrint(exception.toString());
      return exception.toString();
    }
  }
}
