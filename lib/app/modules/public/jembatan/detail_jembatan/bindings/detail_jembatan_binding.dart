import 'package:get/get.dart';

import '../controllers/detail_jembatan_controller.dart';

class DetailJembatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJembatanController>(
      () => DetailJembatanController(),
    );
  }
}
