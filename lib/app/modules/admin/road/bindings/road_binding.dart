import 'package:get/get.dart';

import '../controllers/road_controller.dart';

class RoadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoadController>(
      () => RoadController(),
    );
  }
}
