class MedicamentoDTO {
  final dynamic id;
  final String nome;
  final String lote;
  final double quantidade;
  final String unidadeMedida;
  final String categoria;
  final String dataValidade;
  final String fabricante;
  final double preco;

  MedicamentoDTO({
    this.id,
    required this.nome,
    required this.lote,
    required this.quantidade,
    required this.unidadeMedida,
    required this.categoria,
    required this.dataValidade,
    required this.fabricante,
    required this.preco,
  });
}