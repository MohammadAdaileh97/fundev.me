import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:untitled/model/note_model.dart';
import 'package:untitled/utils/const_value.dart';
import 'package:untitled/utils/shared_preferences_helper.dart';

class DbController {
  late Database database;

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY, Name TEXT, Email TEXT, Password TEXT)',
        );
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, msg TEXT, idUser INTEGER)',
        );
      },
    );
  }

  Future<bool> login({required String email, required String password}) async {
    await openDataBaseFile();
    List<Map> res = await database.rawQuery(
      'SELECT * FROM Users WHERE Email = "$email" AND Password = "$password"',
    );
    await database.close();
    if (res.isNotEmpty) {
      SharedPreferencesHelper().savePrefString(
        key: ConstValue.name,
        value: res[0]["Name"],
      );

      SharedPreferencesHelper().savePrefInt(
        key: ConstValue.id,
        value: res[0]["id"],
      );

      return true;
    } else {
      return false;
    }
  }

  register({
    required String name,
    required String email,
    required String password,
  }) async {
    await openDataBaseFile();
    await database.rawInsert(
      'INSERT INTO Users (Name, Email, Password) VALUES ("$name", "$email", "$password")',
    );
    await database.close();
  }

  insertNote({required String msg}) async {
    await openDataBaseFile();
    int idUser = SharedPreferencesHelper().getPrefInt(
      key: ConstValue.id,
      defaultValue: -1,
    );
    await database.rawInsert(
      'INSERT INTO Note (msg, idUser) VALUES ("$msg", $idUser)',
    );
    await database.close();
  }

  updateNote({required int id, required String msg}) async {
    await openDataBaseFile();
    await database.rawUpdate('Update Note set msg = "$msg" Where id = $id');
    await database.close();
  }

  deleteNote({required int id}) async {
    await openDataBaseFile();
    await database.rawDelete('Delete From Note Where id = $id');
    await database.close();
  }

  Future<List<NoteModel>> getNotes() async {
    List<NoteModel> data = [];
    await openDataBaseFile();
    int idUser = SharedPreferencesHelper().getPrefInt(
      key: ConstValue.id,
      defaultValue: -1,
    );
    List<Map> res = await database.rawQuery(
      'SELECT * FROM Note WHERE idUser = $idUser',
    );
    for (Map i in res) {
      data.add(NoteModel(id: i['id'], msg: i['msg'], idUser: i['idUser']));
    }
    await database.close();
    return data;
  }
}
