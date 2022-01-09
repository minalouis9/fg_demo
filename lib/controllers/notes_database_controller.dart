import 'package:fg_demo/globals/database_commands.dart';
import 'package:fg_demo/helpers/helpers_index.dart';

class NotesDBController{
  static final DatabaseHelper _dbHelper = DatabaseHelper();

  static Future<void> deleteNotesDatabase() async {
    // state = const DatabaseState.deleteDatabase();
    try {
      await _dbHelper.deleteDatabase(kTableName, kCreateDBCmd);
      // state = const DatabaseState.data();
    } catch (e) {
      // state = DatabaseState.onError(e.toString());
      throw Error.safeToString(e);
    }
  }

  static Future<void> deleteNote(int id) async {
    // state = const DatabaseState.deleteData();
    try {
      await _dbHelper.deleteFromDatabase(
          kTableName, kCreateDBCmd, kIDColumnName, id);
      // state = const DatabaseState.data();
    } catch (e) {
      // state = DatabaseState.onError(e.toString());
      throw Error.safeToString(e);
    }
  }

  static Future<void> insertNote(Map<String, dynamic> values) async {
    // state = const DatabaseState.insertData();
    try {
      await _dbHelper.insertInDatabase(kTableName, kCreateDBCmd, values);
      // state = const DatabaseState.data();
    } catch (e) {
      // state = DatabaseState.onError(e.toString());
      throw Error.safeToString(e);
    }
  }

  static Future<List<Map<String, dynamic>>> readAllNotes() async {
    // state = const DatabaseState.readAllData();
    try {
      List<Map<String, dynamic>> data =
      await _dbHelper.readAllFromDatabase(kTableName, kCreateDBCmd);
      // state = DatabaseState.data(data: data);
      return data;
    } catch (e) {
      // state = DatabaseState.onError(e.toString());
      throw Error.safeToString(e);
    }
  }

  static Future<List<Map<String, dynamic>>> readNote(int id) async {
    // state = const DatabaseState.readData();
    try {
      List<Map<String, dynamic>> data = await _dbHelper.readEntryFromDatabase(
          kTableName, kCreateDBCmd, kIDColumnName, id);
      // state = DatabaseState.data(data: data);
      return data;
    } catch (e) {
      // state = DatabaseState.onError(e.toString());
      throw Error.safeToString(e);
    }
  }
}
