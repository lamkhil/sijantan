import 'package:get/get.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  final loader = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    Get.find<CoreController>().getAllData().then((value) {
      if (value) {
        loader.value = true;
      } else {
        getData();
      }
    });
  }
}
