import 'package:agro_pharm_application/app/dominio/dto/dto_medicamento.dart';

abstract class IDAOMedicamento {
  Future<DTOMedicamento> salvar(DTOMedicamento dto);
  Future<DTOMedicamento> alterar(DTOMedicamento dto);
  Future<DTOMedicamento> alterarStatus(int id);
  Future<DTOMedicamento> consultarPorId(int id);
  Future<List<DTOMedicamento>> consultar();
}
