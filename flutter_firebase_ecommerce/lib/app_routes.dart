import 'package:flutter_firebase_ecommerce/views/home/home_view.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static const loginRoute = '/login';
  static const homeRoute = '/home';

  static List<GetPage> getPageList() {
    return [
      GetPage(name: loginRoute, page: () => const HomeView()),
      GetPage(name: homeRoute, page: () => const HomeView()),
    ];
  }
}
