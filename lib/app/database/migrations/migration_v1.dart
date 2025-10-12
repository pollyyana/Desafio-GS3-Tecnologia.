import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    // ===== USERS =====
    batch.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        cpf TEXT NOT NULL,
        password TEXT NOT NULL
      );
    ''');

    batch.execute('''
      INSERT INTO users (id, name, cpf, password) VALUES
      (1, 'Pollyana Banco', '064.084.141-41', '123123'),
      (2, 'Laura', '109.876.543-21', '123123');
    ''');

    // ===== CARTOES =====
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

    batch.execute('''
      INSERT INTO cartoes (id, name, digitos, limit_value, day, user_id) VALUES
      (1, 'GS3 TEC', 5621, 7867.80, 20, 1),
      (2, 'Banco Neon', 9034, 5230.50, 10, 1);
    ''');

    // ===== FATURAS / TRANSACTIONS =====
    batch.execute('''
      CREATE TABLE faturas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cartao_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        parcelas TEXT,
        FOREIGN KEY (cartao_id) REFERENCES cartoes (id) ON DELETE CASCADE
      );
    ''');

    batch.execute('''
      INSERT INTO faturas (id, cartao_id, date, title, amount, parcelas) VALUES
      (1, 1, '2025-09-05T22:35:00Z', 'Apple', 545.99, '12x'),
      (2, 1, '2025-09-05T15:25:00Z', 'Uber*Uber*Trip', 12.96, NULL),
      (3, 1, '2025-09-03T09:34:00Z', 'Carrefour', 349.76, '3x'),
      (4, 2, '2025-09-06T18:22:00Z', 'Netflix', 55.90, NULL),
      (5, 2, '2025-09-04T13:40:00Z', 'Ifood', 28.50, NULL);
    ''');
  }

  @override
  void update(Batch batch) {
    create(batch);
  }
}
