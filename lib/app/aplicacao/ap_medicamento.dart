import 'package:agro_pharm_application/app/banco/sqlite/dao/dao_medicamento.dart';
import 'package:agro_pharm_application/app/dominio/medicamento.dart';
import 'package:sqflite/sqflite.dart';

class AplicacaoMedicamento {
  final MedicamentoDAO medicamentoDAO;

  AplicacaoMedicamento(Database db) : medicamentoDAO = MedicamentoDAO(db);

  Future<void> adicionarMedicamento(Medicamento medicamento) async {
    await medicamentoDAO.criarMedicamento(medicamento);
  }

  Future<void> atualizarMedicamento(Medicamento medicamento) async {
    await medicamentoDAO.atualizarMedicamento(medicamento);
  }

  Future<void> deletarMedicamento(int id) async {
    await medicamentoDAO.deletarMedicamento(id);
  }

  Future<Medicamento?> obterMedicamentoPorId(int id) async {
    return await medicamentoDAO.obterMedicamentoPorId(id);
  }

  Future<List<Medicamento>> listarMedicamentos() async {
    return await medicamentoDAO.listarMedicamentos();
  }

  Future<List<Medicamento>> listarMedicamentosProximosVencimento() async {
    return await medicamentoDAO.listarMedicamentosProximosVencimento();
  }
}
