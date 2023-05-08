import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sijantan2/app/data/models/map/map_model.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';
import 'package:sijantan2/main.dart';

import '../../../../../data/models/detail_spreadsheet_response.dart';
import '../../../../../global/utils/helper.dart';

class DetailJalanArgument {
  String noRuas;
  KondisiJalan jalan;
  List<TaggedPolyline>? poly;

  DetailJalanArgument({required this.noRuas, required this.jalan, this.poly});
}

class DetailJalanController extends GetxController
    with StateMixin<KondisiJalan> {
  Rx<int> tahun = defaultDataYear.obs;
  Rx<Map<String, dynamic>?> information = Rx(null);

  double currentZoom = 15;
  final showInformation = false.obs;

  RxList<TaggedPolyline> selectedPoly = RxList([]);
  RxList<int> generated = RxList([]);
  late MapModel? map;

  MapController mapController = MapController();

  DetailJalanArgument argument = Get.arguments;
  @override
  void onInit() {
    getData();
    map = Get.find<CoreController>()
        .geoJsonParser
        .where((p0) => p0.properties?.noRuas == argument.noRuas)
        .firstOrNull;
    selectedPoly.value =
        List.generate(argument.jalan.kondisiJalan!.length, (index) {
      var data = argument.jalan.kondisiJalan![index];
      var percent = data.values.first /
          argument.jalan.kondisiJalan!
              .map((e) => e.values.reduce((value, element) => value + element))
              .reduce((value, element) => value + element);
      var max = (percent * map!.singleListCoordinate.length).round();
      var ltlng = <LatLng>[];
      for (var i = generated.length; i < (generated.length) + max; i++) {
        if (i < map!.singleListCoordinate.length) {
          var lt = map!.singleListCoordinate[i];
          ltlng.add(LatLng(lt[1], lt[0]));
        }
      }

      generated.addAll(List.generate(ltlng.length, (index) => 1));
      var information = {
        'kondisi': data.keys.first.replaceAll('_', ' ').capitalizeFirst,
        'panjang': "${(data.values.first * 200).toInt()} m",
        'latitude': ltlng[ltlng.length ~/ 2].latitude,
        'longitude': ltlng[ltlng.length ~/ 2].longitude,
      };
      return TaggedPolyline(
        tag: json.encode(information),
        // An optional tag to distinguish polylines in callback
        borderColor: Colors.black,
        borderStrokeWidth: 0.9,
        points: ltlng,
        color: kondisiColorString(data.keys.first),
        strokeWidth: 5.0,
      );
    });
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
    change(null, status: RxStatus.loading());
    final result = await SijantanService.getKondisiJalan(
        tahun.value.toString(), argument.noRuas);
    if (result.success) {
      change(result.data, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.message));
    }
  }
}
