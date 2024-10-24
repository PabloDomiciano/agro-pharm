import 'package:agro_pharm_application/app/banco/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _db;

  static Future<Database> iniciar() async {
    var path = join(await getDatabasesPath(), 'banco.db');

    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      for (String sql in criarTabelas) {
        await db.execute(sql);
      }
      for (String sql in insercoes) {
        await db.execute(sql);
      }
    });

    return _db;
  }
}
