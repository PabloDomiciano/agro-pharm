import 'package:agro_pharm_application/app/banco/sqlite/dao/dao_notificacao.dart';
import 'package:agro_pharm_application/app/dominio/notificacao.dart';

class APNotificacao {
  final NotificacaoDAO daoNotificacao;

  APNotificacao(this.daoNotificacao);

  Future<void> criarNotificacao(Notificacao notificacao) async {
    await daoNotificacao.criarNotificacao(notificacao);
  }

  Future<List<Notificacao>> listarNotificacoes() async {
    return await daoNotificacao.listarNotificacoes();
  }

  Future<void> deletarNotificacao(int id) async {
    await daoNotificacao.deletarNotificacao(id);
  }
}
