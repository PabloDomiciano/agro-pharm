const criarTabelas = [
  '''
    CREATE TABLE medicamento(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(200) NOT NULL,
      dosagem VARCHAR(100) NOT NULL,
      dataValidade TEXT NOT NULL,
      quantidade INTEGER NOT NULL,
      descricao TEXT NULL
    )
  ''',
  '''
    CREATE TABLE notificacao(
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      titulo VARCHAR(200) NOT NULL,
      descricao TEXT NOT NULL,
      data TEXT NOT NULL,
      tipo VARCHAR(100) NOT NULL
    )
  '''
];

const insercoes = [
  '''
    INSERT INTO medicamento (nome, dosagem, dataValidade, quantidade, descricao)
    VALUES ('Paracetamol', '500mg', '2025-12-31', 100, 'Analgésico e antipirético')
  ''',
  '''
    INSERT INTO medicamento (nome, dosagem, dataValidade, quantidade, descricao)
    VALUES ('Ibuprofeno', '200mg', '2024-10-15', 50, 'Anti-inflamatório não esteroidal')
  ''',
  '''
    INSERT INTO medicamento (nome, dosagem, dataValidade, quantidade, descricao)
    VALUES ('Amoxicilina', '250mg', '2025-05-20', 30, 'Antibiótico de amplo espectro')
  ''',
  '''
    INSERT INTO medicamento (nome, dosagem, dataValidade, quantidade, descricao)
    VALUES ('Diazepam', '10mg', '2024-11-01', 20, 'Ansiolítico utilizado para tratar ansiedade')
  ''',
  '''
    INSERT INTO notificacao (titulo, descricao, data, tipo)
    VALUES ('Notificação de Vencimento', 'O Paracetamol está perto do vencimento.', '2025-12-15', 'vencimento')
  ''',
  '''
    INSERT INTO notificacao (titulo, descricao, data, tipo)
    VALUES ('Reabastecer Ibuprofeno', 'Quantidade de Ibuprofeno abaixo do mínimo.', '2024-10-01', 'reabastecimento')
  ''',
  '''
    INSERT INTO notificacao (titulo, descricao, data, tipo)
    VALUES ('Notificação de Amoxicilina', 'A Amoxicilina foi adicionada ao estoque.', '2025-05-21', 'informativa')
  ''',
  '''
    INSERT INTO notificacao (titulo, descricao, data, tipo)
    VALUES ('Atenção com Diazepam', 'O Diazepam deve ser usado com cautela.', '2024-11-01', 'alerta')
  '''
];
