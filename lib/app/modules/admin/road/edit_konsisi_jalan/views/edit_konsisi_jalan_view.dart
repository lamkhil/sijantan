import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../controllers/edit_konsisi_jalan_controller.dart';

class EditKonsisiJalanView extends GetView<EditKonsisiJalanController> {
  const EditKonsisiJalanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
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
                            style:
                                buttonStyle(color: Colors.white, shadow: true),
                            onPressed: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        'Edit Kondisi Jalan',
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
                                            border: InputBorder.none,
                                            hintText: "No Ruas")),
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
                                            border: InputBorder.none,
                                            hintText: "Bogem-Ngasem")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Kerikil',
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
                                            controller.kerikilController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "7.3")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Beton',
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
                                        controller: controller.betonController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "5,5")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Tanah',
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
                                        controller: controller.tanahController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6049")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Aspal',
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
                                        controller: controller.aspalController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6049")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Hotmix',
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
                                        controller: controller.hotmixController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6049")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(45)),
                      Text(
                        'Kondisi',
                        style: textStyle(18,
                            color: Colors.black, weight: FontWeight.w700),
                      ),
                      SizedBox(height: height(15)),
                      Text(
                        'Baik (km)',
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
                                        controller: controller.baikController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6.2")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Sedang (km)',
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
                                        controller: controller.sedangController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "0.7")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Rusak Ringan (km)',
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
                                            controller.rusakRinganController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "0.3")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text(
                        'Rusak Berat (km)',
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
                                            controller.rusakBeratController,
                                        keyboardAppearance: Brightness.dark,
                                        keyboardType: TextInputType.multiline,
                                        style: textStyle(14,
                                            weight: FontWeight.w400),
                                        cursorColor: Colors.black,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "0.1")),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: height(15)),
                      Text('*Isi angka nol (0) jika tidak ada',
                          style: textStyle(14,
                              color: const Color(0xff8E9AAB),
                              weight: FontWeight.w500)),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto1.value.contains('http')
                                    ? Image.network(
                                        controller.foto1.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto1.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto1.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto1.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto2.value.contains('http')
                                    ? Image.network(
                                        controller.foto2.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto2.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto2.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto2.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto3.value.contains('http')
                                    ? Image.network(
                                        controller.foto3.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto3.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto3.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto3.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto4.value.contains('http')
                                    ? Image.network(
                                        controller.foto4.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto4.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto4.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto4.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto5.value.contains('http')
                                    ? Image.network(
                                        controller.foto5.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto5.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto5.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto5.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        height: height(341),
                        width: width(328),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Obx(
                                () => controller.foto6.value.contains('http')
                                    ? Image.network(
                                        controller.foto6.value,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                              child: Text(
                                            "No image loaded at \n ${controller.foto6.value}",
                                            textAlign: TextAlign.center,
                                          ));
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Center(
                                              child: SizedBox(
                                                  height: 16,
                                                  width: 16,
                                                  child: CircularProgressIndicator(
                                                      color: Colors.cyan,
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null)));
                                        },
                                      )
                                    : Image.file(
                                        File(
                                          controller.foto6.value,
                                        ),
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ))),
                      ),
                      SizedBox(height: height(14)),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              controller.foto6.value = image.path;
                            }
                          },
                          style: buttonStyle(color: const Color(0xff0F77BF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: FaIcon(
                                  FontAwesomeIcons.cameraRetro,
                                  color: Colors.white,
                                  size: width(20.0),
                                ),
                              ),
                              SizedBox(width: width(8)),
                              Text(
                                "Edit Foto",
                                style: textStyle(15,
                                    color: Colors.white,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height(57),
                        child: Divider(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      SizedBox(
                        height: height(56),
                        width: width(327),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.onSave();
                          },
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
    },
        onLoading: Container(
          color: Get.theme.scaffoldBackgroundColor,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onError: (err) => Scaffold(
              body: Center(
                child: Text(err ?? 'Server Error'),
              ),
            ));
  }
}
