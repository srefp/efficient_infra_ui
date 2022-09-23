import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tree_demo/bindings/tree_demo_binding.dart';
import '../modules/tree_demo/views/tree_demo_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TREE_DEMO,
      page: () => TreeDemoView(),
      binding: TreeDemoBinding(),
    ),
  ];
}
