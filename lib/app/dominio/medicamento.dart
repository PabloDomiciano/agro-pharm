import 'package:agro_pharm_application/app/dominio/dto/dto_medicamento.dart';
import 'package:agro_pharm_application/app/dominio/interface/i_dao_medicamento.dart';

class Medicamento {
  dynamic _id;
  String? _nome;
  int? _quantidade;
  String? _descricao;
  DateTime? _dataEntrada = DateTime.now();
  DateTime? _dataValidade;
  String? _status = 'A';
  IDAOMedicamento dao;

  Medicamento({required this.dao});

  validar({required DTOMedicamento dto}) {
    nome = dto.nome;
    quantidade = dto.quantidade;
    descricao = dto.descricao;
    dataVencimento = dto.dataValide;
    status = dto.status;
  }

  eNomeVazio(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser vazio');
    if (nome.isEmpty) throw Exception('Nome não pode ser vázio');
    return nome;
  }

  Future<DTOMedicamento> salvar(DTOMedicamento dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOMedicamento> alterar(dynamic id) async {
    this._id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this._id = id;
    await dao.alterarStatus(_id);
    return true;
  }

  Future<DTOMedicamento> consultarPorId(dynamic id) async {
    this._id = id;
    return await dao.consultarPorId(id);
  }

  Future<List<DTOMedicamento>> consultar() async {
    return await dao.consultar();
  }

  String? get nome => _nome;
  int? get quantidade => _quantidade;
  String? get descricao => _descricao;
  DateTime? get dataEntrada => _dataEntrada;
  DateTime? get dataValidade => _dataValidade;
  String? get status => _status;

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo');
    if (nome.isEmpty) throw Exception('Nome não pode ser vázio');
    _nome = nome;
  }

  set quantidade(int? quantidade) {
    if (quantidade == null) throw Exception("A quantidade não pode ser nulo");
    if (quantidade <= 0)
      throw Exception("A quantidade não pode ser menor que 0");
    _quantidade = quantidade;
  }

  set descricao(String? descricao) {
    if (descricao == null) throw Exception('Descrição não pode ser nulo');
    _descricao = descricao;
  }

  set dataVencimento(DateTime? dataVencimento) {
    if (dataVencimento == null)
      throw Exception('A data de vencimento não pode ser nulo');
    _dataValidade = dataVencimento;
  }

  set status(String? status) {
    if (status == null) throw Exception('Status não pode ser nulo.');
    if (status != 'A' || status != 'I')
      throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  }
}
