import 'package:get/get.dart';

import '../controllers/detail_jalan_controller.dart';

class DetailJalanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJalanController>(
      () => DetailJalanController(),
    );
  }
}
