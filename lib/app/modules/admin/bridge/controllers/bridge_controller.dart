import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/models/jembatan_detail.dart';

import '../../../../global/controller/core_controller.dart';

class BridgeController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<List<Jembatan>> {
  late final TabController tabControllerOcasion =
      TabController(length: 2, vsync: this);

  final searchController = TextEditingController();
  final bridgeOcassionController = Get.put(BridgeOcassionController());
  @override
  void onInit() {
    change(Get.find<CoreController>().jembatanDetail,
        status: RxStatus.success());
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        change(Get.find<CoreController>().jembatanDetail,
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .jembatanDetail
            .where((element) =>
                element.nmRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.noJbt!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.nmJbt!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.kecamatan!
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
    Get.delete<BridgeOcassionController>();
    tabControllerOcasion.dispose();
    searchController.dispose();
    super.onClose();
  }
}

class BridgeOcassionController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin<List<KondisiJembatan>> {
  late final TabController tabControllerOcasion =
      TabController(length: 2, vsync: this);

  final tahun = ['2021', '2022'];
  final searchController = TextEditingController();
  @override
  void onInit() {
    getData(0);
    tabControllerOcasion.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>().kondisiJembatanGroupedByTahun[
                tahun[tabControllerOcasion.index]],
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJembatanGroupedByTahun[tahun[tabControllerOcasion.index]]!
            .where((element) =>
                element.nmRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.noJbt!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.nmJbt!
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
      print(tahun[tabControllerOcasion.index]);
    });
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>().kondisiJembatanGroupedByTahun[
                tahun[tabControllerOcasion.index]],
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJembatanGroupedByTahun[tahun[tabControllerOcasion.index]]!
            .where((element) =>
                element.nmRuas!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.noJbt!
                    .isCaseInsensitiveContains(searchController.text) ||
                element.nmJbt!
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

  void getData(int index) {
    change(
        Get.find<CoreController>().kondisiJembatanGroupedByTahun[tahun[index]],
        status: RxStatus.success());
  }

  @override
  void onClose() {
    tabControllerOcasion.dispose();
    searchController.dispose();
    super.onClose();
  }
}
