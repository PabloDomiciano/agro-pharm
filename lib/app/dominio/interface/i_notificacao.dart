import 'package:agro_pharm_application/app/dominio/notificacao.dart';

abstract class INotificacao {
  Future<void> criarNotificacao(Notificacao notificacao);
  Future<List<Notificacao>> listarNotificacoes();
  Future<void> deletarNotificacao(int id);
}
