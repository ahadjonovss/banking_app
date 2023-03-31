import 'package:banking_app/utils/file_importer/file_importer.dart';

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
        "${CardModeFields.isIdol} BOOL,"
        "${CardModeFields.author} TEXT,"
        "${CardModeFields.cardNumber} TEXT,"
        "${CardModeFields.image} TEXT,"
        "${CardModeFields.firstColor} BLOB,"
        "${CardModeFields.secondColor} BLOB"
        ")");
  }

  Future addCard(CardModel cardModel) async {
    Database db = await getDb();
    var id = await db.insert(tableName, cardModel.toJson());
    debugPrint("Card added to Sql");
    return id;
  }

  Future<MyResponse> getAllCards() async {
    Database db = await getDb();
    MyResponse myResponse = MyResponse();

    try{
      var result = await db.query(tableName, columns: [
        CardModeFields.cardNumber,
        CardModeFields.author,
        CardModeFields.image,
        CardModeFields.expireDate,
        CardModeFields.secondColor,
        CardModeFields.firstColor,
        CardModeFields.amount,
        CardModeFields.isIdol,
      ]);
      myResponse.cards = result.toList().map((e) => CardModel.fromJson(e)).toList();

    }catch(e){
      myResponse.status=e.toString();
    }
    return myResponse;


  }

  Future<int> updateCard(CardModel card) async {
    Database db = await getDb();
    return await db.update(tableName, card.toJson(),
        where: "${CardModeFields.cardNumber} = ?", whereArgs: [card.cardNumber]);

  }

  Future deleteCardById(String cardNumber) async {
    Database db = await getDb();
    return await db.delete(tableName,
        where: "${CardModeFields.cardNumber} = ?", whereArgs: [cardNumber]);
  }


  Future updateSum(String cardNumber, int amount, [int currentBill=0]) async {
    Database db = await getDb();
    var result =  await db.query(tableName,
        columns: [
          CardModeFields.cardNumber,
          CardModeFields.author,
          CardModeFields.image,
          CardModeFields.expireDate,
          CardModeFields.secondColor,
          CardModeFields.firstColor,
          CardModeFields.amount,
          CardModeFields.isIdol,

        ],
        where: "${CardModeFields.cardNumber} = ?", whereArgs: [cardNumber]);

    CardModel cardModel = CardModel.fromJson(result[0]);
    if(currentBill==0){
      cardModel.amount+=amount;
    }else{
      cardModel.amount=currentBill;
    }

    updateCard(cardModel);

  }
}
