import 'package:get/get.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CoreController(),
    );
  }
}
