import 'package:agro_pharm_application/app/dominio/medicamento.dart';
import 'package:sqflite/sqflite.dart';

class MedicamentoDAO {
  final Database db;

  MedicamentoDAO(this.db);

  Future<void> criarMedicamento(Medicamento medicamento) async {
    await db.insert('medicamento', medicamento.toMap());
  }

  Future<Medicamento?> obterMedicamentoPorId(int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'medicamento',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Medicamento.fromMap(maps.first);
    }
    return null;
  }

  Future<void> atualizarMedicamento(Medicamento medicamento) async {
    await db.update(
      'medicamento',
      medicamento.toMap(),
      where: 'id = ?',
      whereArgs: [medicamento.id],
    );
  }

  Future<void> deletarMedicamento(int id) async {
    await db.delete(
      'medicamento',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Medicamento>> listarMedicamentos() async {
    final List<Map<String, dynamic>> maps = await db.query('medicamento');
    return List.generate(maps.length, (i) {
      return Medicamento.fromMap(maps[i]);
    });
  }

  Future<List<Medicamento>> listarMedicamentosProximosVencimento() async {
    final dataLimite = DateTime.now().add(Duration(days: 30));

    final List<Map<String, dynamic>> maps = await db.query(
      'medicamento',
      where: 'dataValidade <= ?',
      whereArgs: [dataLimite.toIso8601String()],
    );

    return List.generate(maps.length, (i) {
      return Medicamento.fromMap(maps[i]);
    });
  }
}
