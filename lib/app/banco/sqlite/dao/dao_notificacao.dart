import 'package:agro_pharm_application/app/dominio/interface/i_notificacao.dart';
import 'package:agro_pharm_application/app/dominio/notificacao.dart';
import 'package:sqflite/sqflite.dart';

class NotificacaoDAO implements INotificacao {
  final Database db;

  NotificacaoDAO(this.db);

  @override
  Future<void> criarNotificacao(Notificacao notificacao) async {
    await db.insert('notificacao', {
      'titulo': notificacao.titulo,
      'descricao': notificacao.descricao,
      'data': notificacao.data.toIso8601String(),
      'tipo': notificacao.tipo,
    });
  }

  @override
  Future<List<Notificacao>> listarNotificacoes() async {
    final List<Map<String, dynamic>> maps = await db.query('notificacao');

    return List.generate(maps.length, (i) {
      return Notificacao(
        titulo: maps[i]['titulo'],
        descricao: maps[i]['descricao'],
        data: DateTime.parse(maps[i]['data']),
        tipo: maps[i]['tipo'],
      );
    });
  }

  @override
  Future<void> deletarNotificacao(int id) async {
    await db.delete('notificacao', where: 'id = ?', whereArgs: [id]);
  }
}
