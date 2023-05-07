import 'package:get/get.dart';

import '../controllers/jembatan_controller.dart';

class JembatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JembatanController>(
      () => JembatanController(),
    );
  }
}
