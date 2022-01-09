import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mutex/mutex.dart';

class DatabaseHelper {
  static Mutex mutex = Mutex();

  Future<Database> _initializeDB(String dbName, String createCmd) async {
    /// Open the database and store the reference.
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), dbName),
      // When the database is first created, create a table to store locations.
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(createCmd);
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertInDatabase(
      String dbName, String createCmd, Map<String, dynamic> values) async {
    // Get a reference to the database.
    final Database db = await _initializeDB(dbName, createCmd);

    // Insert the Location into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same location is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      dbName,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteDatabase(
      String dbName, String createCmd) async {
    // Open the database
    Database database = await _initializeDB(dbName, createCmd);

    // Delete the database
    await database.delete(dbName);

    // Close the database
    // await database.close();
  }

  Future<void> deleteFromDatabase(
      String dbName, String createCmd, String columnID, int id) async {
    // Get a reference to the database.
    final Database db = await _initializeDB(dbName, createCmd);

    // Remove the Location from the database.
    await db.delete(
      dbName,
      // Use a `where` clause to delete a specific location.
      where: '$columnID = ?',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> readEntryFromDatabase(
      String dbName, String createCmd, String columnID, int id) async {
    // Open the database
    Database database = await _initializeDB(dbName, createCmd);

    // Query the table for all The locations.
    final List<Map<String, dynamic>> result = await database.query(
      dbName,
      // Use a `where` clause to delete a specific location.
      where: '$columnID = ?',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );

    // Close the database
    // await database.close();

    return result;
  }

  Future<List<Map<String, dynamic>>> readAllFromDatabase(
      String dbName, String createCmd) async {
    // Get a reference to the database.
    final Database database = await _initializeDB(dbName, createCmd);

    // Query the table for all The locations.
    final List<Map<String, dynamic>> result = await database.query(dbName);

    // Close the database
    // await database.close();

    return result;
  }
}
