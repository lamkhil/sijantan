import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sijantan2/app/global/utils/constants/stain_const.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../controllers/edit_informasi_jalan_controller.dart';

class EditInformasiJalanView extends GetView<EditInformasiJalanController> {
  const EditInformasiJalanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Palette.toDark.shade50,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: height(60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      child: ElevatedButton(
                          style: buttonStyle(color: Colors.white, shadow: true),
                          onPressed: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                    ),
                    Text(
                      'Edit Informasi Jalan',
                      style: textStyle(20,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    const SizedBox(width: 50)
                  ],
                ),
                SizedBox(
                  height: height(15),
                ),
                SizedBox(height: height(15)),
                SizedBox(height: height(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'No Ruas',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.noRuasController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Nama Ruas',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.nmRuasController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Titik Pengenal Pangkal',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.pangkalController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Titik Pengenal Ujung',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.ujungController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Panjang (km)',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.panjangController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Lebar',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.lebarController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Fungsi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.fungsiController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(45)),
                    Text(
                      'Lokasi',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Kapanewon',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.kecController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(45)),
                    Text(
                      'Koordinat Pangkal',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Lintang',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller:
                                          controller.latPangkalController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Bujur',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller:
                                          controller.lonPangkalController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(45)),
                    Text(
                      'Koordinat Ujung',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Lintang',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.latUjungController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Bujur',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(8)),
                    Container(
                        height: height(56),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color(0xff1B2A3B).withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                      controller: controller.lonUjungController,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(24)),
                    Container(
                      height: height(341),
                      width: width(328),
                      decoration:
                          boxDecoration(radius: 10, color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GetBuilder<EditInformasiJalanController>(
                              builder: (controller) => FlutterMap(
                                options: MapOptions(
                                  enableScrollWheel: false,
                                  absorbPanEventsOnScrollables: false,
                                  enableMultiFingerGestureRace: false,
                                  onTap: (tapPosition, point) {
                                    if (controller.mode.value == 'pangkal') {
                                      controller.latPangkalController.text =
                                          point.latitude.toStringAsFixed(7);
                                      controller.lonPangkalController.text =
                                          point.longitude.toStringAsFixed(7);
                                    }
                                    if (controller.mode.value == 'ujung') {
                                      controller.latUjungController.text =
                                          point.latitude.toStringAsFixed(7);
                                      controller.lonUjungController.text =
                                          point.longitude.toStringAsFixed(7);
                                    }
                                    controller.update();
                                  },
                                  bounds: LatLngBounds(
                                    LatLng(
                                        double.tryParse(controller
                                                .latPangkalController.text) ??
                                            double.parse(
                                                controller.argument.latAwal!),
                                        double.tryParse(controller
                                                .lonPangkalController.text) ??
                                            double.parse(
                                                controller.argument.lonAwal!)),
                                    LatLng(
                                        double.tryParse(controller
                                                .latUjungController.text) ??
                                            double.parse(
                                                controller.argument.latAkhir!),
                                        double.tryParse(controller
                                                .lonUjungController.text) ??
                                            double.parse(
                                                controller.argument.lonAkhir!)),
                                  ),
                                  boundsOptions: const FitBoundsOptions(
                                      inside: false,
                                      padding: EdgeInsets.all(100)),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    retinaMode: true,
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: LatLng(
                                            double.tryParse(controller
                                                    .latPangkalController
                                                    .text) ??
                                                double.parse(controller
                                                    .argument.latAwal!),
                                            double.tryParse(controller
                                                    .lonPangkalController
                                                    .text) ??
                                                double.parse(controller
                                                    .argument.lonAwal!)),
                                        width: 80,
                                        height: 80,
                                        builder: (context) => SizedBox(
                                          height: 20,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Pangkal"),
                                              FaIcon(
                                                FontAwesomeIcons.locationPin,
                                                color: Colors.cyan,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Marker(
                                        point: LatLng(
                                            double.tryParse(controller
                                                    .latUjungController.text) ??
                                                double.parse(controller
                                                    .argument.latAkhir!),
                                            double.tryParse(controller
                                                    .lonUjungController.text) ??
                                                double.parse(controller
                                                    .argument.lonAkhir!)),
                                        width: 80,
                                        height: 80,
                                        builder: (context) => SizedBox(
                                          height: 20,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Text("Ujung"),
                                              FaIcon(
                                                FontAwesomeIcons.locationPin,
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                child: SizedBox(
                                  width: width(300),
                                  child: Obx(
                                    () => Row(
                                      children: [
                                        Expanded(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        controller.mode.value ==
                                                                'pangkal'
                                                            ? GlobalStain.bg
                                                            : null),
                                                onPressed: () {
                                                  if (controller.mode.value ==
                                                      'pangkal') {
                                                    controller.mode.value =
                                                        'disable';
                                                    return;
                                                  }
                                                  controller.mode.value =
                                                      'pangkal';
                                                },
                                                child: Text(
                                                  "Pangkal",
                                                  style: TextStyle(
                                                      color: controller
                                                                  .mode.value ==
                                                              'pangkal'
                                                          ? Colors.white
                                                          : null),
                                                ))),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Expanded(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        controller.mode.value ==
                                                                'ujung'
                                                            ? GlobalStain.bg
                                                            : null),
                                                onPressed: () {
                                                  if (controller.mode.value ==
                                                      'ujung') {
                                                    controller.mode.value =
                                                        'disable';
                                                    return;
                                                  }
                                                  controller.mode.value =
                                                      'ujung';
                                                },
                                                child: Text(
                                                  "Ujung",
                                                  style: TextStyle(
                                                      color: controller
                                                                  .mode.value ==
                                                              'ujung'
                                                          ? Colors.white
                                                          : null),
                                                ))),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Expanded(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  controller
                                                          .latPangkalController
                                                          .text =
                                                      controller
                                                          .argument.latAwal!;
                                                  controller.latUjungController
                                                          .text =
                                                      controller
                                                          .argument.latAkhir!;
                                                  controller
                                                          .lonPangkalController
                                                          .text =
                                                      controller
                                                          .argument.lonAwal!;
                                                  controller.lonUjungController
                                                          .text =
                                                      controller
                                                          .argument.lonAkhir!;
                                                  controller.update();
                                                },
                                                child: const Text(
                                                  "Reset",
                                                ))),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(14)),
                    Text(
                      '*Geser titik dipeta untuk mengedit atau input angka koordinat diatas',
                      style: textStyle(14,
                          color: const Color(0xff8E9AAB),
                          weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(57)),
                    SizedBox(
                      height: height(56),
                      width: width(327),
                      child: ElevatedButton(
                        onPressed: () => controller.onSave(),
                        style: buttonStyle(color: const Color(0xff0F77BF)),
                        child: Text(
                          "Simpan",
                          style: textStyle(15,
                              color: Colors.white, weight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: height(28)),
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
