import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/detail_spreadsheet_response.dart';
import '../../../../global/controller/core_controller.dart';

class RoadController extends GetxController
    with GetTickerProviderStateMixin, StateMixin<List<KondisiJalan>> {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  late final TabController tabControllerPublic =
      TabController(length: 2, vsync: this);

  RxBool skleton = false.obs;

  final roadOcasionController = Get.put(RoadOcasionController());

  final searchController = TextEditingController();

  final count = 0.obs;
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
    tabController.dispose();
    tabControllerPublic.dispose();
    searchController.dispose();
    Get.delete<RoadOcasionController>();
    super.onClose();
  }

  void increment() => count.value++;
}

class RoadOcasionController extends GetxController
    with GetTickerProviderStateMixin, StateMixin<List<KondisiJalan>> {
  RxBool skleton = false.obs;

  final searchController = TextEditingController();

  final count = 0.obs;

  late final TabController tabControllerYear =
      TabController(length: 2, vsync: this);
  final tahun = ['2021', '2022'];

  @override
  void onInit() {
    getData(0);
    tabControllerYear.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>()
                .kondisiJalanGroupedByTahun[tahun[tabControllerYear.index]],
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJalanGroupedByTahun[tahun[tabControllerYear.index]]!
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
      print(tahun[tabControllerYear.index]);
    });
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        change(
            Get.find<CoreController>()
                .kondisiJalanGroupedByTahun[tahun[tabControllerYear.index]],
            status: RxStatus.success());
      } else {
        var data = Get.find<CoreController>()
            .kondisiJalanGroupedByTahun[tahun[tabControllerYear.index]]!
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
    tabControllerYear.dispose();
    searchController.dispose();
    super.onClose();
  }

  void getData(int index) {
    change(Get.find<CoreController>().kondisiJalanGroupedByTahun[tahun[index]],
        status: RxStatus.success());
  }

  void increment() => count.value++;
}
