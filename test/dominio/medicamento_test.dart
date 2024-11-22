import 'package:flutter_test/flutter_test.dart';

import '../../lib/app/dominio/medicamento.dart';

void main() {
  group('MEDICAMENTO', () {
    group('[e01] MEDICAMENTO - Nome não pode ser vazio', () {
      Medicamento medicamento_teste = Medicamento();
      test('MEDICAMENTO [01] - Nome não pode ser vazio', () {
        expect(() => medicamento_teste.eNomeVazio('Dipirona'), returnsNormally);
      });

      test('MEDICAMENTO [01] - Nome pode ser nulo', () {
        expect(() => medicamento_teste.eNomeVazio(null), throwsException);
      });

      test('MEDICAMENTO [01] - Nome pode ser vazio', () {
        expect(() => medicamento_teste.eNomeVazio(''), throwsException);
      });
    });
  });
}
