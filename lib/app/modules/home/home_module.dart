import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/home/home_bindings.dart';
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/application/modules/module.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
