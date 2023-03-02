import 'package:banking_app/data/models/card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? database;
  String tableName = "cards";

  LocalDatabase();

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}cards.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "${CardModeFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,"
        "${CardModeFields.expireDate} TEXT,"
        "${CardModeFields.amount} REAL,"
        "${CardModeFields.author} TEXT,"
        "${CardModeFields.cardNumber} TEXT,"
        "${CardModeFields.image} TEXT,"
        "${CardModeFields.firstColor} TEXT,"
        "${CardModeFields.secondColor} TEXT"
        ")");
  }

  Future<int> addCard(CardModel cardModel) async {
    Database db = await getDb();
    var id = await db.insert(tableName, cardModel.toJson());
    debugPrint("Card added to Sql");
    return id;
  }

  Future<List<CardModel>> getAllCards() async {
    Database db = await getDb();

    var result = await db.query(tableName, columns: [
      CardModeFields.cardNumber,
      CardModeFields.author,
      CardModeFields.image,
      CardModeFields.expireDate,
      CardModeFields.secondColor,
      CardModeFields.firstColor,
      CardModeFields.amount,
    ]);

    return  result.toList().map((e) => CardModel.fromJson(e)).toList();
  }

  Future<int> updateCard(CardModel card) async {
    Database db = await getDb();
    return await db.update(tableName, card.toJson(),
        where: "id = ?", whereArgs: [card.id]);

  }

  Future deleteCardById(int id) async {
    Database db = await getDb();
    return await db.delete(tableName,
        where: "id = ?", whereArgs: [id]);
  }
}
