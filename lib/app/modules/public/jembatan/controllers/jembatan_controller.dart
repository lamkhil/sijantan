import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';

class JembatanController extends GetxController
    with StateMixin<List<KondisiJembatan>> {
  final searchController = TextEditingController();

  @override
  void onInit() {
    change(
        Get.find<CoreController>().kondisiJembatanGroupedByTahun.values.first,
        status: RxStatus.success());
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>()
                .kondisiJembatanGroupedByTahun
                .values
                .first,
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJembatanGroupedByTahun
            .values
            .first
            .where((element) =>
                element.nmRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.noRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.nmJbt!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.iD!.isCaseInsensitiveContains(searchController.text) ||
                element.noJbt!.isCaseInsensitiveContains(searchController.text))
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
