import 'package:agro_pharm_application/app/banco/sqlite/dao/dao_notificacao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:agro_pharm_application/app/banco/sqlite/conexao.dart';
import 'package:agro_pharm_application/app/dominio/notificacao.dart';

void main() {
  group('NotificacaoDAO Testes', () {
    late Database db;
    late NotificacaoDAO notificacaoDAO;

    setUp(() async {
      db = await Conexao.iniciar();
      notificacaoDAO = NotificacaoDAO(db);
      await db.execute('DELETE FROM notificacao');
    });

    test('Deve criar uma notificação', () async {
      final notificacao = Notificacao(
        titulo: 'Teste de Notificação',
        descricao: 'Esta é uma notificação de teste.',
        data: DateTime.now(),
        tipo: 'teste',
      );

      await notificacaoDAO.criarNotificacao(notificacao);
      final notificacoes = await notificacaoDAO.listarNotificacoes();

      expect(notificacoes.length, 1);
      expect(notificacoes.first.titulo, notificacao.titulo);
    });

    test('Deve listar notificações', () async {
      final notificacao1 = Notificacao(
        titulo: 'Notificação 1',
        descricao: 'Descrição 1',
        data: DateTime.now(),
        tipo: 'tipo1',
      );
      final notificacao2 = Notificacao(
        titulo: 'Notificação 2',
        descricao: 'Descrição 2',
        data: DateTime.now(),
        tipo: 'tipo2',
      );

      await notificacaoDAO.criarNotificacao(notificacao1);
      await notificacaoDAO.criarNotificacao(notificacao2);

      final notificacoes = await notificacaoDAO.listarNotificacoes();
      expect(notificacoes.length, 2);
    });

    test('Deve deletar uma notificação', () async {
      final notificacao = Notificacao(
        titulo: 'Notificação para deletar',
        descricao: 'Descrição',
        data: DateTime.now(),
        tipo: 'tipo',
      );

      await notificacaoDAO.criarNotificacao(notificacao);
      final notificacoesAntes = await notificacaoDAO.listarNotificacoes();
      expect(notificacoesAntes.length, 1);

      await notificacaoDAO.deletarNotificacao(1);
      final notificacoesDepois = await notificacaoDAO.listarNotificacoes();
      expect(notificacoesDepois.length, 0);
    });
  });
}
