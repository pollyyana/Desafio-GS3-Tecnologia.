import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    // Criação da tabela users
    batch.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        cpf TEXT NOT NULL,
        password TEXT NOT NULL
      );
    ''');

    // Insere dados fixos na tabela users
    batch.execute('''
      INSERT INTO users (name, cpf, password) VALUES
      ('Pollyana Medeiros', '064.084.141-41', '123123'),
      ('Maria Oliveira', '987.654.321-00', 'minhasenha');
    ''');

    // Criação da tabela cartoes
    batch.execute('''
      CREATE TABLE cartoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        digitos INTEGER NOT NULL,
        limit_value REAL NOT NULL,
        day INTEGER NOT NULL,
        user_id INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
      );
    ''');

    // Insere dados fixos na tabela cartoes
    batch.execute('''
      INSERT INTO cartoes (name, digitos, limit_value, day, user_id) VALUES
      ('Visa Gold', 1234, 5000.00, 10, 1),
      ('Mastercard Platinum', 5678, 10000.00, 15, 2);
    ''');

    batch.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cartao_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        parcelas TEXT,
        FOREIGN KEY (cartao_id) REFERENCES cartoes (id) ON DELETE CASCADE
      );
    ''');

    // Insere dados fixos na tabela transactions
    batch.execute('''
      INSERT INTO transactions (cartao_id, date, title, amount, parcelas) VALUES
      (1, '2024-10-10', 'Compra Supermercado', 150.75, '3x'),
      (2, '2024-10-09', 'Pagamento Netflix', 29.90, NULL);
    ''');
  }

  @override
  void update(Batch batch) {
    // Para versão 1, update é igual a create
    create(batch);
  }
}
