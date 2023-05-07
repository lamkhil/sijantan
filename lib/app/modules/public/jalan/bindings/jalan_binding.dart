import 'package:get/get.dart';

import '../controllers/jalan_controller.dart';

class JalanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JalanController>(
      () => JalanController(),
    );
  }
}
