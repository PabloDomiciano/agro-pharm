import 'package:agro_pharm_application/app/dominio/medicamento.dart';

abstract class IMedicamento{
  Future<void> criarMedicamento(Medicamento medicamento);

  Future<Medicamento?> obterMedicamentoPorId(int id);

  Future<void> atualizarMedicamento(Medicamento medicamento);

  Future<void> deletarMedicamento(int id);

  Future<List<Medicamento>> listarMedicamentos();

  Future<List<Medicamento>> listarMedicamentosProximosVencimento();
}
