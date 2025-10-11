import 'package:gs3_tecnologia/app/core/modulo/bank_list_module.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_controller.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';
import 'package:gs3_tecnologia/app/services/user_service.dart';
import 'package:provider/provider.dart';

class AuthModule extends BankListModule {
  AuthModule()
    : super(
        bindings: [
          ChangeNotifierProvider(
            create: (context) => SplashController(
              // userService: context.read(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginController(context.read<UserService>()),
          ),
        ],
        routers: {
          '/login': (context) => const SplashPage(),
        },
      );
}

// bankListPage vai encapsular as rotas automaticamente pra nao ter que passar aqui
// class AuthModule extends TodoListModule {
//   @override
//   AuthModule() : super(
//     bindings: [
//       ChangeNotifierProvider(
//         create: (_) => LoginController(),
//       ), // // ChangeNotifierProvider
//     ],
//     routers: [
//       '/login': (context) => MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (_) => LoginController(),
//           ), // // ChangeNotifierProvider
//         ],
//         child: LoginPage(),
//       ), // // MultiProvider
//     ],
//   );
// }
