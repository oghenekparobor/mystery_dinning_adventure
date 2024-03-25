import 'package:injectable/injectable.dart';
import 'package:mystery_dinning_adventure/core/logger/app_logger.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseWrapper {
  DatabaseWrapper({
    required this.database,
  });

  final Database database;

  Future<void> initializeDatabase(
    String dbName,
    List<String> createTableQueries,
  ) async {
    final String path = '${await getDatabasesPath()}/$dbName.db';

    // Check if database already exists
    final dbExists = await databaseExists(path);

    if (!dbExists) {
      try {
        // Create a new database
        await openDatabase(path, version: 1, onCreate: (_, int version) async {
          for (final query in createTableQueries) {
            await database.execute(query);
          }
        });

        AppLogger.log('Database created at $path');
      } on DatabaseException catch (e) {
        AppLogger.log(e);
      }
    } else {
      // Open existing database
      try {
        await openDatabase(path);
        AppLogger.log('Database opened at $path');
      } on DatabaseException catch (e) {
        AppLogger.log(e);
      }
    }
  }
}
