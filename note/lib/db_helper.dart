import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'note.dart';

class DbHelper {
  late Database database;

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, msg TEXT)',
        );
      },
    );
  }

  insertNote({required String msg}) async {
    await openDataBaseFile();
    await database.rawInsert("Insert INTO Note (msg) VALUES ('$msg')");
    await database.close();
  }

  updateNote({required int id, required String msg}) async {
    await openDataBaseFile();
    await database.rawUpdate("Update Note Set msg = '$msg' WHERE id = $id");
    await database.close();
  }

  deleteNote({required int id}) async {
    await openDataBaseFile();
    await database.rawDelete("Delete From Note WHERE id = $id");
    await database.close();
  }

  Future<List<Note>> getNotes() async {
    List<Note> notes = [];
    await openDataBaseFile();
    List<Map> res = await database.rawQuery("SELECT * FROM Note");

    for (Map i in res) {
      notes.add(Note(id: i['id'], msg: i['msg']));
    }

    await database.close();
    return notes;
  }
}
