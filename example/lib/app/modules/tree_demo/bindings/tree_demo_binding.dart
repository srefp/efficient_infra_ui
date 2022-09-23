import 'package:get/get.dart';

import '../controllers/tree_demo_controller.dart';

class TreeDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreeDemoController>(
      () => TreeDemoController(),
    );
  }
}
