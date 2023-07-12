import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //methold create table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cartItems(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      subtitle TEXT,
      price INTEGER,
      quantity INTEGER
    )
    """);
  }

  //call method to create
  static Future<sql.Database> db() async {
    return sql.openDatabase("cartItems.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      print('..creating a table...');
      await createTables(database);
    });
  }

  //add data
  static Future<int> createItem(
      String title, String subtitle, int price, int quantity) async {
    final db = await SQLHelper.db();
    final data = {
      "title": title,
      "subtitle": subtitle,
      'price': price,
      'quantity': quantity
    };
    //insert the data , conflictalgorithm prevent duplicate
    final id = await db.insert("cartItems", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  //get all item
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query("cartItems", orderBy: "id");
  }

  //get specific item
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query("cartItems", where: "id = ?", whereArgs: [id], limit: 1);
  }

  //update data
  static Future<int> updateItem(
      int id, String title, String subtitle, int price, int quantity) async {
    final db = await SQLHelper.db();
    final data = {
      "title": title,
      "subtitle": subtitle,
      'price': price,
      'quantity': quantity
      // "createdAt": DateTime.now().toString()
    }; //map data type

    final result =
        await db.update("cartItems", data, where: "id = ?", whereArgs: [id]);
    print('sucesss update');

    return result;
  }

  //delete data
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cartItems", where: "id=?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
