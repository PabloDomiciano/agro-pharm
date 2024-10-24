import 'package:agro_pharm_application/app/dominio/medicamento.dart';
import 'package:test/test.dart';

void main() {
  group('Testes de Medicamento', () {
    test('Teste 1 - Medicamento válido', () {
      Medicamento medicamentoValido = Medicamento(
        id: 01,
        nome: 'Paracetamol',
        lote: '12345',
        quantidade: 100,
        unidadeMedida: 'mg',
        categoria: 'Analgésico',
        dataValidade: DateTime.now().add(Duration(days: 30)),
        fabricante: 'FabricaMed',
        preco: 15.0,
      );

      expect(medicamentoValido.validar(), true,
          reason: 'Medicamento deve ser válido.');
    });

    test('Teste 2 - Medicamento com nome vazio', () {
      Medicamento medicamentoNomeVazio = Medicamento(
        id: 02,
        nome: '',
        lote: '12345',
        quantidade: 100,
        unidadeMedida: 'mg',
        categoria: 'Analgésico',
        dataValidade: DateTime.now().add(Duration(days: 30)),
        fabricante: 'FabricaMed',
        preco: 15.0, 
      );

      expect(medicamentoNomeVazio.validar(), false,
          reason: 'Nome não pode ser vazio.');
    });

    test('Teste 3 - Medicamento com data expirada', () {
      Medicamento medicamentoDataExpirada = Medicamento(
        id: 03,
        nome: 'Ibuprofeno',
        lote: '54321',
        quantidade: 50,
        unidadeMedida: 'mg',
        categoria: 'Antiinflamatório',
        dataValidade: DateTime.now().subtract(Duration(days: 10)),
        fabricante: 'MedFarma',
        preco: 20.0,
      );

      expect(medicamentoDataExpirada.validar(), false,
          reason: 'Data de validade deve estar no futuro.');
    });

    test('Teste 4 - Medicamento próximo do vencimento', () {
      Medicamento medicamentoNotificarVencimento = Medicamento(
        id: 04,
        nome: 'Amoxicilina',
        lote: '67890',
        quantidade: 25,
        unidadeMedida: 'mg',
        categoria: 'Antibiótico',
        dataValidade: DateTime.now().add(Duration(days: 10)),
        fabricante: 'AntibióticoLab',
        preco: 50.0,
      );

      expect(
          medicamentoNotificarVencimento.notificarSeProximoDoVencimento(), true,
          reason: 'Deve notificar medicamento com vencimento em até 15 dias.');
    });
  });
}
