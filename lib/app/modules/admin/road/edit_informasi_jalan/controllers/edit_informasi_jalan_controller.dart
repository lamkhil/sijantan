import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/data/models/jalan_detail.dart';
import 'package:sijantan2/app/data/services/sijantan_service.dart';
import 'package:sijantan2/app/global/widget/loading_dialog.dart';

class EditInformasiJalanController extends GetxController {
  final Jalan argument = Get.arguments;

  final mode = 'pangkal'.obs;

  final noRuasController = TextEditingController();
  final nmRuasController = TextEditingController();
  final pangkalController = TextEditingController();
  final ujungController = TextEditingController();
  final panjangController = TextEditingController();
  final lebarController = TextEditingController();
  final fungsiController = TextEditingController();
  final kecController = TextEditingController();
  final latPangkalController = TextEditingController();
  final lonPangkalController = TextEditingController();
  final latUjungController = TextEditingController();
  final lonUjungController = TextEditingController();

  @override
  void onInit() {
    noRuasController.text = argument.noRuas ?? '';
    nmRuasController.text = argument.nmRuas ?? '';
    pangkalController.text = argument.pangkal ?? '';
    ujungController.text = argument.ujung ?? '';
    panjangController.text = argument.panjang ?? '';
    lebarController.text = argument.lebar ?? '';
    fungsiController.text = argument.fungsi ?? '';
    kecController.text = argument.kec ?? '';
    latPangkalController.text = argument.latAwal ?? '';
    lonPangkalController.text = argument.lonAwal ?? '';
    latUjungController.text = argument.latAkhir ?? '';
    lonUjungController.text = argument.lonAkhir ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    noRuasController.dispose();
    nmRuasController.dispose();
    pangkalController.dispose();
    ujungController.dispose();
    panjangController.dispose();
    lebarController.dispose();
    fungsiController.dispose();
    kecController.dispose();
    latPangkalController.dispose();
    lonPangkalController.dispose();
    latUjungController.dispose();
    lonUjungController.dispose();
    super.onClose();
  }

  onSave() async {
    LoadingDialog.basic();
    final data = {
      'API-KEY': 'FhdcbXTqdmtBK7HE',
      'no_ruas': noRuasController.text,
      'nm_ruas': nmRuasController.text,
      'panjang': panjangController.text,
      'lebar': lebarController.text,
      //'fungsi': fungsiController.text,
      'kec': kecController.text,
      'pangkal': pangkalController.text,
      'ujung': ujungController.text,
      'lat_awal': latPangkalController.text,
      'lat_akhir': latUjungController.text,
      'lon_awal': lonPangkalController.text,
      'lon_akhir': lonUjungController.text
    };
    if (data.values.contains('')) {
      Get.back();
      Get.snackbar("Oops!", "Isian tidak boleh kosong!");
      return;
    }
    final result = await SijantanService.updateDetailJalan(data);
    Get.back();
    Get.back();
    Get.snackbar("Update", result.message ?? 'Update gagal. Server Error!');
  }
}
