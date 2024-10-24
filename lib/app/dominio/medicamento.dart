class Medicamento {
  dynamic id;
  String nome;
  DateTime dataValidade;
  int quantidade;
  String lote;
  String unidadeMedida;
  String categoria;
  String fabricante;
  double preco;

  Medicamento({
    this.id,
    required this.nome,
    required this.dataValidade,
    required this.quantidade,
    required this.lote,
    required this.unidadeMedida,
    required this.categoria,
    required this.fabricante,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'dataValidade': dataValidade.toIso8601String(),
      'quantidade': quantidade,
      'lote': lote,
      'unidadeMedida': unidadeMedida,
      'categoria': categoria,
      'fabricante': fabricante,
      'preco': preco,
    };
  }

  static Medicamento fromMap(Map<String, dynamic> map) {
    return Medicamento(
      id: map['id'],
      nome: map['nome'],
      dataValidade: DateTime.parse(map['dataValidade']),
      quantidade: map['quantidade'],
      lote: map['lote'],
      unidadeMedida: map['unidadeMedida'],
      categoria: map['categoria'],
      fabricante: map['fabricante'],
      preco: map['preco'],
    );
  }

  bool validar() {
    return _validarNome() &&
        _validarLote() &&
        _validarQuantidade() &&
        _validarUnidadeMedida() &&
        _validarCategoria() &&
        _validarDataValidade() &&
        _validarFabricante() &&
        _validarPreco();
  }

  bool _validarNome() {
    return nome.isNotEmpty && nome.length >= 2;
  }

  bool _validarLote() {
    return lote.isNotEmpty;
  }

  bool _validarQuantidade() {
    return quantidade > 0;
  }

  bool _validarUnidadeMedida() {
    List<String> unidadesValidas = ['mg', 'ml', 'comprimidos', 'g'];
    return unidadeMedida.isNotEmpty && unidadesValidas.contains(unidadeMedida);
  }

  bool _validarCategoria() {
    return categoria.isNotEmpty;
  }

  bool _validarDataValidade() {
    return dataValidade.isAfter(DateTime.now());
  }

  bool _validarFabricante() {
    return fabricante.isNotEmpty;
  }

  bool _validarPreco() {
    return preco > 0;
  }

  bool notificarSeProximoDoVencimento() {
    final diasRestantes = dataValidade.difference(DateTime.now()).inDays;
    return diasRestantes <= 15 && diasRestantes >= 0;
  }
}
