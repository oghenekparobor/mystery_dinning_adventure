import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseWrapper {
  DatabaseWrapper();

  Database? database;

  Future<void> initializeDatabase(
    String dbName,
    List<String> createTableQueries,
  ) async {
    final String path = '${await getDatabasesPath()}/$dbName.db';

    // Check if database already exists
    final dbExists = await databaseExists(path);
    AppLogger.log(dbExists);

    if (!dbExists) {
      try {
        // Create a new database
        database = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            for (final query in createTableQueries) {
              await db.execute(query);
            }
          },
        );

        var tables = await database!.query(
          "sqlite_master",
          columns: ["name"],
          where: "type = 'table'",
        );

        AppLogger.log('Database created at $path');
        AppLogger.log(tables);
      } on DatabaseException catch (e, s) {
        AppLogger.log(e, s);
      }
    } else {
      // Open existing database
      try {
        database = await openDatabase(path);

        var tables = await database!.query(
          "sqlite_master",
          columns: ["name"],
          where: "type = 'table'",
        );

        AppLogger.log('Database opened at $path');
        AppLogger.log(tables);
      } on DatabaseException catch (e, s) {
        AppLogger.log(e, s);
      }
    }
  }

  Future<void> save({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    AppLogger.log(table);
    AppLogger.log(data);

    await database?.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> read(
    String table, [
    String? where,
    List? whereArgs,
  ]) async {
    var maps = await database?.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );

    return List.generate((maps ?? []).length, (i) => (maps ?? [])[i]);
  }
}
