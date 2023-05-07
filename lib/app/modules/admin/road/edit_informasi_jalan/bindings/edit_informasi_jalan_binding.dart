import 'package:get/get.dart';

import '../controllers/edit_informasi_jalan_controller.dart';

class EditInformasiJalanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditInformasiJalanController>(
      () => EditInformasiJalanController(),
    );
  }
}
