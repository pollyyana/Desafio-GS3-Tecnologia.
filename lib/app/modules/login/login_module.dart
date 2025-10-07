import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gs3_tecnologia/app/modules/login/login_bindigs.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:gs3_tecnologia/application/modules/module.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindigs(),
    ),
  ];
}
