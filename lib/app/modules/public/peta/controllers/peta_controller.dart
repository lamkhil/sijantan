import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';
import 'package:sijantan2/app/modules/public/jalan/detail_jalan/controllers/detail_jalan_controller.dart';
import 'package:sijantan2/app/modules/public/jembatan/detail_jembatan/controllers/detail_jembatan_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../data/models/jembatan_detail.dart';
import '../../../../global/utils/helper.dart';

class PetaController extends GetxController {
  Rx<KondisiJalan?> selectedJalan = Rx(null);
  Rx<Jembatan?> selectedJembatan = Rx(null);
  Rx<List<TaggedPolyline>?> selectedPoly = Rx(null);
  RxList<int> generated = RxList([]);

  var polyLines =
      List.generate(Get.find<CoreController>().geoJsonParser.length, (index) {
    List<LatLng> x = [];
    var geo = Get.find<CoreController>().geoJsonParser[index];
    for (List<double> element in geo.singleListCoordinate) {
      x.add(LatLng(element[1], element[0]));
    }
    return TaggedPolyline(
      tag: Get.find<CoreController>().geoJsonParser[index].properties?.noRuas,
      // An optional tag to distinguish polylines in callback
      borderColor: Colors.transparent,
      borderStrokeWidth: 0.0,
      points: x,
      color: kondisiColor(Get.find<CoreController>()
              .kondisiJalanGroupedByRuas[geo.properties!.noRuas]
              ?.kondisi ??
          0),
      strokeWidth: 2.0,
    );
  });

  List<TaggedPolyline> get polyLines2 {
    var pol = <TaggedPolyline>[];
    for (var index = 0;
        index < Get.find<CoreController>().geoJsonParser.length;
        index++) {
      var geo = Get.find<CoreController>().geoJsonParser[index];
      for (var element in geo.coordinate) {
        List<LatLng> x = [];
        for (var cor in element) {
          x.add(LatLng(cor[1], cor[0]));
        }
        pol.add(TaggedPolyline(
          tag: Get.find<CoreController>()
              .geoJsonParser[index]
              .properties
              ?.noRuas,
          // An optional tag to distinguish polylines in callback
          borderColor: Colors.black,
          borderStrokeWidth: 0.9,
          points: x,
          color: kondisiColor(Get.find<CoreController>()
                  .kondisiJalanGroupedByRuas[geo.properties!.noRuas]
                  ?.kondisi ??
              0),
          strokeWidth: 3.0,
        ));
      }
    }
    return pol;
  }

  List<TaggedPolyline> get coloredPolylines {
    List<TaggedPolyline> polyline = [];
    for (var poly in polyLines) {
      if (poly.tag != "1" && poly.tag != "2") {
        for (var poly2 in polyLines2
            .where((element) => element.tag == poly.tag)
            .toList()) {
          List<int> generated = [];
          var temp = Get.find<CoreController>()
              .kondisiJalanGroupedByTahun
              .keys
              .toList();
          var jalanBaru = temp.map((e) => int.parse(e)).toList();
          jalanBaru.sort();

          var jalan = Get.find<CoreController>()
              .kondisiJalanGroupedByTahun[jalanBaru.last.toString()];
          var jalanPoly =
              jalan?.where((element) => element.noRuas == poly.tag).firstOrNull;
          polyline.addAll(
              List.generate(jalanPoly?.kondisiJalan?.length ?? 0, (index) {
            var data = jalanPoly?.kondisiJalan![index];
            var percent = (data?.values.first ?? 0) /
                (jalanPoly?.kondisiJalan
                        ?.map((e) => e.values
                            .reduce((value, element) => value + element))
                        .reduce((value, element) => value + element) ??
                    1);
            var max = (percent * poly2.points.length).round();
            var ltlng = <LatLng>[];
            for (var i = generated.length; i < (generated.length) + max; i++) {
              if (i < poly2.points.length) {
                ltlng.add(poly2.points[i]);
              }
            }

            generated.addAll(List.generate(ltlng.length, (index) => 1));
            return TaggedPolyline(
              tag: poly2.tag,
              // An optional tag to distinguish polylines in callback
              borderColor: Colors.black,
              borderStrokeWidth: 0.9,
              points: ltlng,
              color: kondisiColorString(data?.keys.first ?? '0'),
              strokeWidth: 3.0,
            );
          }));
        }
      } else {
        List<int> generated = [];
        var temp =
            Get.find<CoreController>().kondisiJalanGroupedByTahun.keys.toList();
        var jalanBaru = temp.map((e) => int.parse(e)).toList();
        jalanBaru.sort();

        var jalan = Get.find<CoreController>()
            .kondisiJalanGroupedByTahun[jalanBaru.last.toString()];
        var jalanPoly =
            jalan?.where((element) => element.noRuas == poly.tag).firstOrNull;
        polyline.addAll(
            List.generate(jalanPoly?.kondisiJalan?.length ?? 0, (index) {
          var data = jalanPoly?.kondisiJalan![index];
          var percent = (data?.values.first ?? 0) /
              (jalanPoly?.kondisiJalan
                      ?.map((e) =>
                          e.values.reduce((value, element) => value + element))
                      .reduce((value, element) => value + element) ??
                  1);
          var max = (percent * poly.points.length).round();
          var ltlng = <LatLng>[];
          for (var i = generated.length; i < (generated.length) + max; i++) {
            if (i < poly.points.length) {
              ltlng.add(poly.points[i]);
            }
          }

          generated.addAll(List.generate(ltlng.length, (index) => 1));
          return TaggedPolyline(
            tag: poly.tag,
            // An optional tag to distinguish polylines in callback
            borderColor: Colors.black,
            borderStrokeWidth: 0.9,
            points: ltlng,
            color: kondisiColorString(data?.keys.first ?? '0'),
            strokeWidth: 3.0,
          );
        }));
      }
    }
    return polyline;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  redirectMap() {
    if (selectedJalan.value != null) {
      final jalan = Get.find<CoreController>()
          .jalanDetailGroupByRuas[selectedJalan.value!.noRuas];
      launchUrlString(
        "https://maps.google.com/?q=${jalan?.latAwal},${jalan?.lonAwal}",
      );
    } else {
      final jembatan = Get.find<CoreController>()
          .jembatanDetailGroupByid[selectedJembatan.value!.iD];
      launchUrlString(
        "https://maps.google.com/?q=${jembatan?.latitude},${jembatan?.longitude}",
      );
    }
  }

  redirectDetail() {
    if (selectedJalan.value != null) {
      Get.toNamed(Routes.DETAIL_JALAN,
          arguments: DetailJalanArgument(
              noRuas: selectedJalan.value!.noRuas!,
              jalan: selectedJalan.value!,
              poly: selectedPoly.value));
    } else if (selectedJembatan.value != null) {
      Get.toNamed(Routes.DETAIL_JEMBATAN,
          arguments: DetailJembatanArgument(
              iD: selectedJembatan.value!.iD!,
              jembatan: selectedJembatan.value!));
    }
  }

  selectJalan(List<TaggedPolyline> polylines) {
    clearPop();
    selectedPoly.value = coloredPolylines
        .where((element) => polylines.first.tag == element.tag)
        .toList();
    var temp =
        Get.find<CoreController>().kondisiJalanGroupedByTahun.keys.toList();
    var jalanBaru = temp.map((e) => int.parse(e)).toList();
    jalanBaru.sort();

    var jalan = Get.find<CoreController>()
        .kondisiJalanGroupedByTahun[jalanBaru.last.toString()];
    selectedJalan.value = jalan
        ?.where((element) => element.noRuas == polylines.first.tag)
        .firstOrNull;
  }

  selectJembatan(Jembatan? jembatan) {
    clearPop();
    selectedJembatan.value = jembatan;
  }

  void clearPop() {
    selectedJalan.value = null;
    selectedPoly.value = null;
    generated.clear();
    selectedJembatan.value = null;
  }
}
