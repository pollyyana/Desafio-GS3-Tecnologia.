import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/repositories/cartao_repository.dart';

class CartaoRepositoryImpl implements CartaoRepository {
  final SqliteConnectionFactory _connectionFactory;

  CartaoRepositoryImpl(this._connectionFactory);

  @override
  Future<List<CartaoModel>> getAll() async {
    try {
      final conn = await _connectionFactory.openConnection();
      final result = await conn.rawQuery('SELECT * FROM cartoes');

      if (result.isEmpty) {
        throw AppException('Nenhum cartão encontrado no banco.');
      }

      return result.map((e) => CartaoModel.fromMap(e)).toList();
    } catch (e) {
      throw AppException('Erro ao buscar cartões: $e');
    }
  }
}
