import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/note_model.dart';

class NoteController extends ChangeNotifier {
  late Database database;
  List<NoteModel> notes = [];
  bool showErrorMessage = false;

  checkErrorMsg({required String msg}) {
    showErrorMessage = msg.isEmpty;
    notifyListeners();
  }

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, msg TEXT, userId INTEGER)',
        );

        await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  insertNote({required String msg, required int userId}) async {
    await openDataBaseFile();
    await database.rawInsert(
      "INSERT INTO Note (msg, userId) VALUES ('$msg', $userId)",
    );
    await database.close();
    getAllNotes(userId: userId);
  }

  updateNote({
    required String msg,
    required int id,
    required int userId,
  }) async {
    await openDataBaseFile();
    await database.rawUpdate("UPDATE Note SET msg = '$msg' WHERE id = $id");
    await database.close();
    getAllNotes(userId: userId);
  }

  deleteNote({required int id, required int userId}) async {
    await openDataBaseFile();
    await database.rawDelete("DELETE FROM Note WHERE id = $id");
    await database.close();
    getAllNotes(userId: userId);
  }

  getAllNotes({required int userId}) async {
    await openDataBaseFile();
    notes.clear();
    List<Map<String, dynamic>> noteMaps = await database.rawQuery(
      "SELECT * FROM Note WHERE userId = $userId",
    );

    for (Map<String, dynamic> i in noteMaps) {
      notes.add(NoteModel(id: i['id'], msg: i['msg'], userId: i['userId']));
    }
    await database.close();
    notifyListeners();
  }
}
