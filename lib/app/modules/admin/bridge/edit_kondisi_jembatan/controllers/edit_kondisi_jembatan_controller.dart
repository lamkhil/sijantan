import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';
import 'package:sijantan2/app/global/widget/loading_dialog.dart';

class EditKondisiJembatanController extends GetxController {
  final KondisiJembatan arguments = Get.arguments;
  final id = TextEditingController();
  final tahun = TextEditingController();
  final nm_jbt = TextEditingController();
  final panjang = TextEditingController();
  final lebar = TextEditingController();
  final jml_bentang = TextEditingController();
  final tipe_str = TextEditingController();
  final bhn_str = TextEditingController();
  final kds_str = TextEditingController();
  final bhn1_lt = TextEditingController();
  final bhn2_lt = TextEditingController();
  final kds_lt = TextEditingController();
  final bhn1_san = TextEditingController();
  final bhn2_san = TextEditingController();
  final kds_san = TextEditingController();
  final kp_tipe = TextEditingController();
  final kp_bhn = TextEditingController();
  final kp_kon = TextEditingController();
  final pd_tipe = TextEditingController();
  final pd_bahan = TextEditingController();
  final pd_kon = TextEditingController();
  final kerusakan1 = TextEditingController();
  final kerusakan2 = TextEditingController();

  @override
  void onInit() {
    id.text = arguments.iD!;
    tahun.text = arguments.tahun!;
    nm_jbt.text = arguments.nmJbt!;
    panjang.text = arguments.panjang!;
    lebar.text = arguments.lebar!;
    jml_bentang.text = arguments.jmlBentang!;
    tipe_str.text = arguments.tipeStr!;
    bhn_str.text = arguments.bhnStr!;
    kds_str.text = arguments.kdsStr!;
    bhn1_lt.text = arguments.bhn1Lt!;
    bhn2_lt.text = arguments.bhn2Lt!;
    kds_lt.text = arguments.kdsLt!;
    bhn1_san.text = arguments.bhn1San!;
    bhn2_san.text = arguments.bhn2San!;
    kds_san.text = arguments.kdsSan!;
    kp_tipe.text = arguments.kpTipe!;
    kp_bhn.text = arguments.kpBhn!;
    kp_kon.text = arguments.kpKon!;
    pd_tipe.text = arguments.pdTipe!;
    pd_bahan.text = arguments.pdBhn!;
    pd_kon.text = arguments.pdKon!;
    kerusakan1.text = arguments.kerusakan1!;
    kerusakan2.text = arguments.kerusakan2!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    id.dispose();
    tahun.dispose();
    nm_jbt.dispose();
    panjang.dispose();
    lebar.dispose();
    jml_bentang.dispose();
    tipe_str.dispose();
    bhn_str.dispose();
    kds_str.dispose();
    bhn1_lt.dispose();
    bhn2_lt.dispose();
    kds_lt.dispose();
    bhn1_san.dispose();
    bhn2_san.dispose();
    kds_san.dispose();
    kp_tipe.dispose();
    kp_bhn.dispose();
    kp_kon.dispose();
    pd_tipe.dispose();
    pd_bahan.dispose();
    kerusakan1.dispose();
    kerusakan2.dispose();
    pd_kon.dispose();
    super.onClose();
  }

  void onSave() async {
    LoadingDialog.basic();
    final result =
        await SijantanService.updateKondisiJembatan(dio.FormData.fromMap({
      'API-KEY': 'FhdcbXTqdmtBK7HE',
      'ID': id.text,
      'tahun': tahun.text,
      'nm_jbt': nm_jbt.text,
      'panjang': panjang.text,
      'lebar': lebar.text,
      'jml_bentang': jml_bentang.text,
      'Tipe_Str': tipe_str.text,
      'Bhn_Str': bhn_str.text,
      'Kds_Str': kds_str.text,
      'Bhn1_Lt': bhn1_lt.text,
      'Bhn2_Lt': bhn2_lt.text,
      'Kds_Lt': kds_lt.text,
      'Bhn1_San': bhn1_san.text,
      'Bhn2_San': bhn2_san.text,
      'Kds_San': kds_san.text,
      'Kp_Tipe': kp_tipe.text,
      'Kp_Bhn': kp_bhn.text,
      'Kp_Kon': kp_kon.text,
      'Pd_Tipe': pd_tipe.text,
      'Pd_Bhn': pd_bahan.text,
      'Pd_Kon': pd_kon.text,
      'Kerusakan1': kerusakan1.text,
      'Kerusakan2': kerusakan2.text
    }));
    if (result.success) {
      Get.back();
      Get.back();
    } else {
      Get.back();
      Get.snackbar("Oops!", result.message ?? "Server Error");
    }
  }
}
