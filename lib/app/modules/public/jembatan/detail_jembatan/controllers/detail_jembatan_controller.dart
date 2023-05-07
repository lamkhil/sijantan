import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/models/jembatan_detail.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';

import '../../../../../../main.dart';

class DetailJembatanArgument {
  String iD;
  Jembatan jembatan;

  DetailJembatanArgument({required this.iD, required this.jembatan});
}

class DetailJembatanController extends GetxController
    with StateMixin<KondisiJembatan> {
  final DetailJembatanArgument argument = Get.arguments;

  final currentZoom = 13.0.obs;

  Rx<int> tahun = defaultDataYear.obs;
  final mapController = MapController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    mapController.dispose();
    super.onClose();
  }

  Future<void> getData() async {
    final result =
        await SijantanService.getKondisiJembatan(tahun.toString(), argument.iD);
    if (result.success) {
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.message));
    }
  }
}
