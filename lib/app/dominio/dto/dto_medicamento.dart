class DTOMedicamento {
  dynamic id;
  final String nome;
  final int quantidade;
  final String descricao;
  final DateTime dataEntrada;
  final DateTime dataValide;
  final String status;

  DTOMedicamento(
      {this.id,
      required this.nome,
      required this.quantidade,
      required this.descricao,
      required this.dataEntrada,
      required this.dataValide,
      this.status = 'A'});
}
