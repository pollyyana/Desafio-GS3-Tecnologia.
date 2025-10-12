import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/models/fatura_model.dart';
import 'package:gs3_tecnologia/app/repositories/fatura/fatura_repository.dart';

class FaturaRepositoryImpl implements FaturaRepository {
  final SqliteConnectionFactory _connectionFactory;

  FaturaRepositoryImpl(SqliteConnectionFactory connectionFactory)
    : _connectionFactory = connectionFactory;

  @override
  Future<List<FaturaModel>> buscarFaturasPorCartao(int cartaoId) async {
    final conn = await _connectionFactory.openConnection();
    final result = await conn.query(
      'faturas',
      where: 'cartao_id = ?',
      whereArgs: [cartaoId],
    );

    return result.map((e) {
      try {
        return FaturaModel.fromMap(e);
      } catch (err) {
        print('[FaturaRepositoryImpl] Erro ao converter fatura: $err');
        return FaturaModel(
          title: '${e['title'] ?? 'Erro ao carregar'}',
          amount: 0,
          date: DateTime.now(),
          parcelas: 1,
        );
      }
    }).toList();
  }

  @override
  Future<void> salvarFatura(FaturaModel fatura, int cartaoId) async {
    final conn = await _connectionFactory.openConnection();

    await conn.insert('faturas', {
      'cartao_id': cartaoId,
      'title': fatura.title,
      'amount': fatura.amount,
      'date': fatura.date.toIso8601String(),
      'parcelas': fatura.parcelas,
    });
  }
}
