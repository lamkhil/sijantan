import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/public/grafik/views/widget/grafik_all.dart';
import 'package:sijantan2/app/modules/public/grafik/views/widget/grafik_detail.dart';
import 'package:sijantan2/app/modules/public/grafik/views/widget/grafik_detail2.dart';

import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';
import '../controllers/grafik_controller.dart';

class GrafikView extends GetView<GrafikController> {
  const GrafikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height(181),
                  child: Column(
                    children: [
                      SizedBox(height: height(60)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50,
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      color: Colors.white, shadow: true),
                                  onPressed: () => Get.back(),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),
                            ),
                            Text(
                              'Grafik',
                              style: textStyle(width(20),
                                  color: Colors.black, weight: FontWeight.w700),
                            ),
                            const SizedBox(width: 50)
                          ],
                        ),
                      ),
                      SizedBox(height: height(15)),
                      SizedBox(
                        width: width(327),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Perbandingan Kondisi Jalan',
                                  style: textStyle(width(14),
                                      color: const Color(0xff1A1A1A),
                                      weight: FontWeight.w600),
                                ),
                                Text(
                                  'Tahun 2021-2022',
                                  style: textStyle(width(12),
                                      color: const Color(0xff1A1A1A),
                                      weight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width(120),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      color: Colors.white,
                                      circular: 5,
                                      shadow: true),
                                  onPressed: () => controller.drawer.value =
                                      controller.drawer.value ? false : true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() => Text(
                                            controller.list.value,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black),
                                          )),
                                      Obx(() => Icon(controller.drawer.value
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up)),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height(15)),
                Expanded(
                    child: SizedBox(
                  height: height(300),
                  width: widthFull(),
                  child: Obx(() => controller.list.value == "Semua"
                      ? const GrafikAll()
                      : controller.list.value == "2021"
                          ? const GrafikDetail()
                          : const GrafikDetail2()),
                ))
              ],
            ),
            Positioned(
                top: height(185),
                right: width(25),
                child: Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: controller.drawer.value ? 130 : 0,
                    child: Container(
                      height: height(150),
                      width: width(120),
                      decoration: boxDecoration(
                        color: Palette.toDark.shade50,
                        radius: 6,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                              height: height(30),
                              child: GestureDetector(
                                onTap: () => {
                                  controller.list.value = "Semua",
                                  controller.drawer.value =
                                      controller.drawer.value ? false : true,
                                },
                                child: SizedBox(
                                  child: Text(
                                    'Semua',
                                    textAlign: TextAlign.center,
                                    style: textStyle(width(12),
                                        color: const Color.fromARGB(
                                            255, 36, 37, 37),
                                        weight: FontWeight.w600),
                                  ),
                                ),
                              )),
                          SizedBox(
                              height: height(30),
                              child: GestureDetector(
                                onTap: () => {
                                  controller.list.value = "2021",
                                  controller.drawer.value =
                                      controller.drawer.value ? false : true,
                                },
                                child: SizedBox(
                                  child: Text(
                                    '2021',
                                    textAlign: TextAlign.center,
                                    style: textStyle(width(12),
                                        color: const Color.fromARGB(
                                            255, 36, 37, 37),
                                        weight: FontWeight.w600),
                                  ),
                                ),
                              )),
                          SizedBox(
                              height: height(30),
                              child: GestureDetector(
                                onTap: () => {
                                  controller.list.value = "2022",
                                  controller.drawer.value =
                                      controller.drawer.value ? false : true,
                                },
                                child: SizedBox(
                                  child: Text(
                                    '2022',
                                    textAlign: TextAlign.center,
                                    style: textStyle(width(12),
                                        color: const Color.fromARGB(
                                            255, 36, 37, 37),
                                        weight: FontWeight.w600),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ))))
          ],
        ),
      ),
    );
  }
}
