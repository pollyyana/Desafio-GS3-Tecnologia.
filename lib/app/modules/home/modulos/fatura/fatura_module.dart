import 'package:gs3_tecnologia/app/core/modulo/bank_list_module.dart';
import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_controller.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_page.dart';
import 'package:gs3_tecnologia/app/repositories/fatura/fatura_repository.dart';
import 'package:gs3_tecnologia/app/repositories/fatura/fatura_repository_impl.dart';
import 'package:gs3_tecnologia/app/services/fatura/fatura_service.dart';
import 'package:gs3_tecnologia/app/services/fatura/fatura_service_impl.dart';
import 'package:provider/provider.dart';

class FaturaModule extends BankListModule {
  FaturaModule()
    : super(
        bindings: [
          Provider<FaturaRepository>(
            create: (context) => FaturaRepositoryImpl(
              context.read<SqliteConnectionFactory>(),
            ),
          ),

          Provider<FaturaService>(
            create: (context) => FaturaServiceImpl(
              repository: context.read<FaturaRepository>(),
            ),
          ),

          ChangeNotifierProvider(
            create: (context) => FaturaController(
              faturaService: context.read<FaturaService>(),
            ),
          ),
        ],

        routers: {
          '/fatura': (context) => const FaturaPage(),
        },
      );
}
