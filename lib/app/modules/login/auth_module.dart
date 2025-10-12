import 'package:gs3_tecnologia/app/core/modulo/bank_list_module.dart';
import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_controller.dart';
import 'package:gs3_tecnologia/app/repositories/login/login_repository.dart';
import 'package:gs3_tecnologia/app/repositories/login/login_repository_impl.dart';
import 'package:gs3_tecnologia/app/services/login/login_service.dart';
import 'package:gs3_tecnologia/app/services/login/login_service_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AuthModule extends BankListModule {
  final List<SingleChildWidget> providers;

  AuthModule()
    : providers = [
        Provider<LoginRepository>(
          create: (_) => LoginRepositoryImpl(SqliteConnectionFactory()),
        ),
        Provider<LoginService>(
          create: (context) =>
              LoginServiceImpl(repository: context.read<LoginRepository>()),
        ),
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(
            loginService: context.read<LoginService>(),
          ),
        ),
        ChangeNotifierProvider<SplashController>(
          create: (context) => SplashController(),
        ),
      ],
      super(
        bindings: [],
        routers: {
          '/login': (context) => LoginPage(),
        },
      );
}
