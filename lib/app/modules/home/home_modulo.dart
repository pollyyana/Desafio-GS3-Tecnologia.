import 'package:gs3_tecnologia/app/core/modulo/bank_list_module.dart';
import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_repository.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_repository_impl.dart';
import 'package:gs3_tecnologia/app/services/cartao/cartao_service.dart';
import 'package:gs3_tecnologia/app/services/cartao/cartao_service_impl.dart';
import 'package:provider/provider.dart';

class HomeModule extends BankListModule {
  HomeModule()
    : super(
        bindings: [
          // ✅ Fábrica de conexão com o banco SQLite
          Provider<SqliteConnectionFactory>(
            create: (_) => SqliteConnectionFactory(),
          ),

          // ✅ Repository
          Provider<CartaoRepository>(
            create: (context) => CartaoRepositoryImpl(
              context.read<SqliteConnectionFactory>(),
            ),
          ),

          // ✅ Service
          Provider<CartaoService>(
            create: (context) => CartaoServiceImpl(
              repository: context.read<CartaoRepository>(),
            ),
          ),

          // ✅ Controller
          ChangeNotifierProvider<CartaoController>(
            create: (context) => CartaoController(
              cartaoService: context.read<CartaoService>(),
            ),
          ),
        ],
        routers: {
          '/home': (context) => const HomePage(),
        },
      );
}
