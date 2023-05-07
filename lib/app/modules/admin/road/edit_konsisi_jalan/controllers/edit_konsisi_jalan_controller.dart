import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';
import 'package:sijantan2/app/global/widget/loading_dialog.dart';
import 'package:dio/dio.dart' as dio;

class EditKonsisiJalanController extends GetxController
    with StateMixin<KondisiJalan> {
  final KondisiJalan argument = Get.arguments;
  final noRuasController = TextEditingController();
  final nmRuasController = TextEditingController();
  final hotmixController = TextEditingController();
  final aspalController = TextEditingController();
  final betonController = TextEditingController();
  final kerikilController = TextEditingController();
  final tanahController = TextEditingController();
  final baikController = TextEditingController();
  final sedangController = TextEditingController();
  final rusakRinganController = TextEditingController();
  final rusakBeratController = TextEditingController();

  final foto1 = ''.obs;
  final foto2 = ''.obs;
  final foto3 = ''.obs;
  final foto4 = ''.obs;
  final foto5 = ''.obs;
  final foto6 = ''.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    SijantanService.getKondisiJalan(
            argument.tahun ?? '2022', argument.noRuas ?? '1')
        .then((value) {
      final kondisi = value.data;
      if (kondisi != null) {
        noRuasController.text = kondisi.noRuas!;
        nmRuasController.text = kondisi.nmRuas!;
        hotmixController.text = kondisi.hotmix!;
        aspalController.text = kondisi.aspal!;
        betonController.text = kondisi.beton!;
        kerikilController.text = kondisi.kerikil!;
        tanahController.text = kondisi.tanah ?? '';
        baikController.text = kondisi.baik!;
        sedangController.text = kondisi.sedang!;
        rusakRinganController.text = kondisi.rusakRingan!;
        rusakBeratController.text = kondisi.rusakBerat!;
        foto1.value = kondisi.photo1!;
        foto2.value = kondisi.photo2!;
        foto3.value = kondisi.photo3!;
        foto4.value = kondisi.photo4!;
        foto5.value = kondisi.photo5!;
        foto6.value = kondisi.photo6!;
        change(kondisi, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(value.message));
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    noRuasController.dispose();
    nmRuasController.dispose();
    hotmixController.dispose();
    aspalController.dispose();
    betonController.dispose();
    kerikilController.dispose();
    tanahController.dispose();
    baikController.dispose();
    sedangController.dispose();
    rusakRinganController.dispose();
    rusakBeratController.dispose();
    super.onClose();
  }

  void onSave() async {
    LoadingDialog.basic();

    final foto = [foto1, foto2, foto3, foto4, foto5, foto6];
    final data = {
      'API-KEY': 'FhdcbXTqdmtBK7HE',
      'tahun': argument.tahun,
      'no_ruas': argument.noRuas,
      'baik': baikController.text,
      'sedang': sedangController.text,
      'rusak_ringan': rusakRinganController.text,
      'rusak_berat': rusakBeratController.text,
      'hotmix': hotmixController.text,
      'aspal': aspalController.text,
      'beton': betonController.text,
      'kerikil': kerikilController.text,
      'tanah': tanahController.text,
      for (int i = 1; i < 7; i++)
        if (foto[i - 1].value.contains('http'))
          'foto$i': dio.MultipartFile.fromBytes(
              File(foto[i - 1].value).readAsBytesSync())
    };
    if (data.values.contains('')) {
      Get.back();
      Get.snackbar("Oops!", "Isian tidak boleh kosong");
      return;
    }
    final result =
        await SijantanService.updateKondisiJalan(dio.FormData.fromMap(data));
    Get.back();
    Get.back();
    Get.snackbar("Update", result.message ?? "Server Error");
  }
}
