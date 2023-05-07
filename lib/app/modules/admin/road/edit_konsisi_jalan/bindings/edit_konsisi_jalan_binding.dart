import 'package:get/get.dart';

import '../controllers/edit_konsisi_jalan_controller.dart';

class EditKonsisiJalanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKonsisiJalanController>(
      () => EditKonsisiJalanController(),
    );
  }
}
