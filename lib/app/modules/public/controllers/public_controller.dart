import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';

class PublicController extends GetxController {
  final pageController = PageController(keepPage: true);
  final lastRoad =
      Get.find<CoreController>().kondisiJalanGroupedByTahun.values.first;
  final lastBridge =
      Get.find<CoreController>().kondisiJembatanGroupedByTahun.values.first;

  @override
  void onInit() {
    super.onInit();
  }
}
