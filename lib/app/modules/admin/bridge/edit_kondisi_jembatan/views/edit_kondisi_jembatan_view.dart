import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../controllers/edit_kondisi_jembatan_controller.dart';

class EditKondisiJembatanView extends GetView<EditKondisiJembatanController> {
  const EditKondisiJembatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Palette.toDark.shade50,
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
                      'Edit Data Jembatan',
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
                      'Informasi',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Tahun',
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
                                      controller: controller.tahun,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: height(15)),
                    Text(
                      'Nama Jembatan',
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
                                      controller: controller.nm_jbt,
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
                      'Dimensi',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Panjang',
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
                                      controller: controller.panjang,
                                      keyboardAppearance: Brightness.dark,
                                      keyboardType: TextInputType.multiline,
                                      style: textStyle(14,
                                          weight: FontWeight.w400),
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      )),
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
                                      controller: controller.lebar,
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
                      'Bentang',
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
                                      controller: controller.jml_bentang,
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
                      'Struktur Bangunan Atas',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Tipe',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.tipe_str,
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
                      'Bahan',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.bhn_str,
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
                      'Kondisi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kds_str,
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
                      'Lantai',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Bahan 1',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.bhn1_lt,
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
                      'Bahan 2',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.bhn2_lt,
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
                      'Kondisi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kds_lt,
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
                      'Sandaran',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Bahan 1',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.bhn1_san,
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
                      'Bahan 2',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.bhn2_san,
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
                      'Kondisi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kds_san,
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
                      'Kepala Jembatan / Pilar',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Tipe',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kp_tipe,
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
                      'Bahan',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kp_bhn,
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
                      'Kondisi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kp_kon,
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
                      'Pondasi',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Tipe',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.pd_tipe,
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
                      'Bahan',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.pd_bahan,
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
                      'Kondisi',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.pd_kon,
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
                      'Kondisi',
                      style: textStyle(18,
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    SizedBox(height: height(15)),
                    Text(
                      'Kerusakan 1',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kerusakan1,
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
                      'Kerusakan 2',
                      style: textStyle(14,
                          color: Colors.black, weight: FontWeight.w500),
                    ),
                    SizedBox(height: height(15)),
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
                                      controller: controller.kerusakan2,
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
