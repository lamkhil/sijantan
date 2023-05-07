import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';

class JalanController extends GetxController
    with StateMixin<List<KondisiJalan>> {
  final searchController = TextEditingController();

  final currentPage = 1.obs;

  @override
  void onInit() {
    change(Get.find<CoreController>().kondisiJalanGroupedByTahun.values.first,
        status: RxStatus.success());
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>().kondisiJalanGroupedByTahun.values.first,
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJalanGroupedByTahun
            .values
            .first
            .where((element) =>
                element.nmRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.noRuas!
                    .isCaseInsensitiveContains(searchController.text))
            .toList();
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
