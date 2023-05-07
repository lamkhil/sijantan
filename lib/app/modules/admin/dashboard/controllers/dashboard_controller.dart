import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs;

  final User user = Get.arguments;

  RxBool index = false.obs;
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
