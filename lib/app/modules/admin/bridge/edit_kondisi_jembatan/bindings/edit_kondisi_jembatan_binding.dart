import 'package:get/get.dart';

import '../controllers/edit_kondisi_jembatan_controller.dart';

class EditKondisiJembatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKondisiJembatanController>(
      () => EditKondisiJembatanController(),
    );
  }
}
