import 'package:agro_pharm_application/app/banco/sqlite/conexao.dart';
import 'package:agro_pharm_application/app/dominio/dto/dto_medicamento.dart';
import 'package:agro_pharm_application/app/dominio/interface/i_dao_medicamento.dart';
import 'package:sqflite/sqflite.dart';

class DAOMedicamento implements IDAOMedicamento {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO medicamento (nome, quantidade, descricao, dataEntrada, dataValidade, status)
    VALUES (?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE medicamento SET nome=?, quantidade=?, descricao=?, dataEntrada=?, dataValidade=?, status=?
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE medicamento SET status='I'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM medicamento WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM medicamento;
  ''';

  @override
  Future<DTOMedicamento> salvar(DTOMedicamento dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [
      dto.nome,
      dto.quantidade,
      dto.descricao,
      dto.dataEntrada,
      dto.dataValide,
      dto.status
    ]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOMedicamento> alterar(DTOMedicamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [
      dto.nome,
      dto.quantidade,
      dto.descricao,
      dto.dataEntrada,
      dto.dataValide,
      dto.status
    ]);
    return dto;
  }

  @override
  Future<DTOMedicamento> alterarStatus(int id) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return alterarStatus(id);
  }

  @override
  Future<List<DTOMedicamento>> consultar() async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlConsultar);
    return consultar();
  }

  @override
  Future<DTOMedicamento> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlConsultarPorId, [id]);
    return consultarPorId(id);
  }
}
