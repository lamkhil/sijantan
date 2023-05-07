import 'package:get/get.dart';

import '../controllers/edit_jembatan_controller.dart';

class EditJembatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditJembatanController>(
      () => EditJembatanController(),
    );
  }
}
