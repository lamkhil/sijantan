import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/models/jalan_detail.dart';
import 'package:sijantan2/app/data/models/jembatan_detail.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';
import 'package:sijantan2/app/data/services/spreadsheet_service.dart';

import '../../data/models/map/map_model.dart';

class CoreController extends GetxController {
  RxList<MapModel> geoJsonParser = <MapModel>[].obs;
  GeoJsonParser geoJsonParser2 = GeoJsonParser();
  Rx<DetailSpreadSheetResponse?> detailData = Rx(null);

  RxList<Jalan> jalanDetail = RxList([]);
  late Map<String, Jalan> jalanDetailGroupByRuas;
  RxList<Jembatan> jembatanDetail = RxList([]);
  late Map<String, Jembatan> jembatanDetailGroupByid;
  late Map<String, List<Jembatan>> jembatanDetailGroupByRuas;

  Map<String, List<KondisiJalan>> _kondisiJalanGroupedByTahun = {};
  Map<String, List<KondisiJalan>> get kondisiJalanGroupedByTahun {
    if (_kondisiJalanGroupedByTahun.isNotEmpty) {
      return _kondisiJalanGroupedByTahun;
    }
    _kondisiJalanGroupedByTahun = groupBy(
            detailData.value!.toJson()['jalan'], (Map p0) => p0['tahun'])
        .map((key, value) => MapEntry(
            key,
            value
                .map((e) => KondisiJalan.fromJson(e.cast<String, dynamic>()))
                .toList()));
    return _kondisiJalanGroupedByTahun;
  }

  Map<String, KondisiJalan> _kondisiJalanGroupedByRuas = {};
  Map<String, KondisiJalan> get kondisiJalanGroupedByRuas {
    if (_kondisiJalanGroupedByRuas.isNotEmpty) {
      return _kondisiJalanGroupedByRuas;
    }
    _kondisiJalanGroupedByRuas = groupBy(
            detailData.value!.toJson()['jalan'], (Map p0) => p0['no_ruas'])
        .map((key, value) => MapEntry(
            key,
            value
                .map((e) => KondisiJalan.fromJson(e.cast<String, dynamic>()))
                .toList()
                .first));
    return _kondisiJalanGroupedByRuas;
  }

  Map<String, List<KondisiJembatan>> _kondisiJembatanGroupedByTahun = {};
  Map<String, List<KondisiJembatan>> get kondisiJembatanGroupedByTahun {
    if (_kondisiJembatanGroupedByTahun.isNotEmpty) {
      return _kondisiJembatanGroupedByTahun;
    }
    _kondisiJembatanGroupedByTahun = groupBy(
            detailData.value!.toJson()['jembatan'], (Map p0) => p0['tahun'])
        .map((key, value) => MapEntry(
            key,
            value
                .map((e) => KondisiJembatan.fromJson(e.cast<String, dynamic>()))
                .toList()));
    return _kondisiJembatanGroupedByTahun;
  }

  Map<String, List<KondisiJembatan>> _kondisiJembatanGroupedByRuas = {};
  Map<String, List<KondisiJembatan>> get kondisiJembatanGroupedByRuas {
    if (_kondisiJembatanGroupedByRuas.isNotEmpty) {
      return _kondisiJembatanGroupedByRuas;
    }
    _kondisiJembatanGroupedByRuas = groupBy(
            detailData.value!.toJson()['jembatan'], (Map p0) => p0['no_ruas'])
        .map((key, value) => MapEntry(
            key,
            value
                .map((e) => KondisiJembatan.fromJson(e.cast<String, dynamic>()))
                .toList()));
    return _kondisiJembatanGroupedByRuas;
  }

  Map<String, KondisiJembatan> _kondisiJembatanGroupedByID = {};
  Map<String, KondisiJembatan> get kondisiJembatanGroupedByID {
    if (_kondisiJembatanGroupedByID.isNotEmpty) {
      return _kondisiJembatanGroupedByID;
    }
    _kondisiJembatanGroupedByID = groupBy(
            detailData.value!.toJson()['jembatan'], (Map p0) => p0['ID'])
        .map((key, value) => MapEntry(
            key,
            value
                .map((e) => KondisiJembatan.fromJson(e.cast<String, dynamic>()))
                .toList()
                .first));
    return _kondisiJembatanGroupedByID;
  }

  Future<bool> getAllData() async {
    try {
      await Future.wait(
          [getDetailData(), getDetailJalan(), getDetailJembatan()]);
      mapData();
      return true;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }

  Future<void> getDetailData() async {
    final result = await SpreadSheetService.getAll();
    detailData.value = result;
  }

  Future<void> getDetailJalan() async {
    final result = await SijantanService.getDetailJalan();
    if (result.success) {
      jalanDetail.value = result.data!;
      var map = <String, Jalan>{};
      for (var element in jalanDetail) {
        map[element.noRuas!] = element;
      }
      jalanDetailGroupByRuas = map;
    }
  }

  Future<void> getDetailJembatan() async {
    final result = await SijantanService.getDetailJembatan();
    if (result.success) {
      jembatanDetail.value = result.data!;
      var map = <String, Jembatan>{};
      for (var element in jembatanDetail) {
        map[element.iD!] = element;
      }
      jembatanDetailGroupByid = map;
      jembatanDetailGroupByRuas = groupBy(
              jembatanDetail.map((element) => element.toJson()).toList(),
              (p0) => p0['no_ruas'])
          .map((key, value) => MapEntry(
              key,
              value
                  .map((e) => Jembatan.fromJson(e.cast<String, dynamic>()))
                  .toList()));
    }
  }

  Future<void> mapData() async {
    List temporary = [];
    final data =
        await rootBundle.loadString('assets/json/Jalan_Kabupaten.geojson');
    geoJsonParser2.parseGeoJsonAsString(data);
    Map<String, dynamic> sample = await jsonDecode(data);
    sample["features"].forEach((element) => temporary.add(element));
    for (var element in temporary) {
      geoJsonParser.add(MapModel.fromJson(element));
    }
  }
}
