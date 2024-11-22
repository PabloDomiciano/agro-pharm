import 'package:agro_pharm_application/app/dominio/dto/dto_medicamento.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MEDICAMENTO', () {
    group('[e01] MEDICAMENTO - Nome não pode ser vazio', () {
      DTOMedicamento medicamento = DTOMedicamento(
          id: 01,
          nome: 'Dipirona',
          dataEntrada: DateTime.now(),
          dataValide: DateTime.now(),
          descricao: 'Gado',
          quantidade: 22,
          status: 'A');

      test('MEDICAMENTO [01] - Nome não pode ser vazio', () {
        expect(() => medicamento.nome, returnsNormally);
      });
    });
  });
}
