import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        cpf TEXT NOT NULL,
        password TEXT NOT NULL
      );
    ''');

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
  }

  @override
  void update(Batch batch) {
    // Para a versão 1, update é igual ao create
    create(batch);
  }
}
