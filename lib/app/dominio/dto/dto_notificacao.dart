import 'package:agro_pharm_application/app/dominio/notificacao.dart';

class NotificacaoDTO {
  final String titulo;
  final String descricao;
  final String data;
  final String tipo;

  NotificacaoDTO({
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.tipo,
  });

  Notificacao toNotificacao() {
    return Notificacao(
      titulo: titulo,
      descricao: descricao,
      data: DateTime.parse(data),
      tipo: tipo,
    );
  }

  static NotificacaoDTO fromNotificacao(Notificacao notificacao) {
    return NotificacaoDTO(
      titulo: notificacao.titulo,
      descricao: notificacao.descricao,
      data: notificacao.data.toIso8601String(),
      tipo: notificacao.tipo,
    );
  }
}
