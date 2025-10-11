import 'package:gs3_tecnologia/app/core/modulo/bank_list_module.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:provider/provider.dart';

class AuthModule extends BankListModule {
  AuthModule()
    : super(
        //fica as dependecias
        bindings: [
          ChangeNotifierProvider(
            create: (context) => LoginController(
              // userService: context.read(),
            ),
          ),
          // ChangeNotifierProvider(
          //   create: (context) =>
          //       RegisterController(userService: context.read()),
          // ),
        ],
        routers: {
          '/login': (context) => const LoginPage(),
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
