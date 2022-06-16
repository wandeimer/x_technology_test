import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:x_technology_test/data/user.dart';

class UserDB {
  late Database _database;
  bool isDBinit = false;

  Future<Database> get database async {
    if (isDBinit == false) {
      _database = await initialize();
    }
    return _database;
  }

  UserDB();

  Future<Database> initialize() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    var path = join(documentsDir.path, "db.db");
    Database db = await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT, email TEXT, password TEXT)");
    });
    isDBinit = true;
    return db;
  }

  Future<List<User>> getAllUsers() async {
    Database db = await database;
    List<Map> query = await db.rawQuery("SELECT * FROM Users ORDER BY id DESC");
    List<User> result = [];
    query.forEach((r) => result.add(User(r["id"], r["name"], r["phone"], r["email"], r["password"])));
    return result;
  }

  Future<List<User>> loginByPhone({required String phone, required String pass}) async {
    Database db = await database;
    List<Map> query =
        await db.rawQuery("SELECT * FROM Users WHERE phone = ? AND password = ? ORDER BY id DESC", [phone, pass]);
    List<User> result = [];
    query.forEach((r) => result.add(User(r["id"], r["name"], r["phone"], r["email"], r["password"])));
    return result;
  }

  Future<List<User>> loginByMail({required String email, required String pass}) async {
    Database db = await database;
    List<Map> query =
        await db.rawQuery("SELECT * FROM Users WHERE email = ? AND password = ? ORDER BY id DESC", [email, pass]);
    List<User> result = [];
    query.forEach((r) => result.add(User(r["id"], r["name"], r["phone"], r["email"], r["password"])));
    return result;
  }

  Future<void> addUser({
    required String name,
    required String phone,
    required String email,
    required String pass,
  }) async {
    Database db = await database;
    db.rawInsert(
        "INSERT INTO Users (name, phone, email, password) VALUES (\"$name\", \"$phone\", \"$email\", \"$pass\")");
  }

  Future<void> addExpense(String name, double price, DateTime dateTime) async {
    Database db = await database;
    String dateAsString = dateTime.toString();
    db.rawInsert("INSERT INTO Users (name, date, price) VALUES (\"$name\", \"$dateAsString\", $price)");
  }

  Future<void> deleteUser({required int id}) async {
    Database db = await database;
    db.rawDelete("DELETE FROM Users WHERE id = ?", ["$id"]);
  }

  Future<void> deleteAllUsers() async {
    Database db = await database;
    db.rawDelete("DELETE FROM Users");
  }
}
