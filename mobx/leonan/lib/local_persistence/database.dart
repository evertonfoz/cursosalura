import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'lp_constants.dart';

class SQFLiteDatabase {
  static Database _database;

  SQFLiteDatabase._privateConstructor();
  static final SQFLiteDatabase instance = SQFLiteDatabase._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, kDatabaseName);
    return await openDatabase(
      path,
      version: kDatabaseVersion,
      onCreate: _onCreateDb,
      onUpgrade: _nUpgradeDb,
      onDowngrade: _onDowngradeDb,
    );
  }

  Future _onCreateDb(Database database, int version) async {
    await database.execute("CREATE TABLE palavras ("
     "palavraID TEXT PRIMARY KEY,"
     "palavra TEXT,"
     "ajuda TEXT"
     ")"
    );

  }
  Future _nUpgradeDb(
      Database database, int previousVersion, int newVersion) async {}
  Future _onDowngradeDb(
      Database database, int previousVersion, int newVersion) async {}
}
