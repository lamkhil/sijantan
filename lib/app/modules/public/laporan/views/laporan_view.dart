import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/public/laporan/views/widget/laporan.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../global/utils/helper.dart';
import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  const LaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: width(30)),
                child: Column(children: [
                  SizedBox(
                    height: height(281),
                    child: Column(
                      children: [
                        SizedBox(height: height(60)),
                        Row(
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
                              'Laporan',
                              style: textStyle(width(20),
                                  color: Colors.black, weight: FontWeight.w700),
                            ),
                            const SizedBox(width: 50)
                          ],
                        ),
                        SizedBox(height: height(15)),
                        SizedBox(
                            height: height(56),
                            width: width(327),
                            child: ElevatedButton(
                              style: buttonStyle(
                                  color: Colors.white,
                                  circular: 5,
                                  shadow: true),
                              onPressed: () {
                                //Get.to(() => const LaporanViewJalan());

                                launchUrl(
                                    Uri.parse(
                                      "https://drive.google.com/file/d/10rIiLuhGhKll5-61AQrbRT9FZdX73X2m/view?usp=share_link",
                                    ),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width(17)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Laporan Jalan',
                                      style: textStyle(width(18),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const Icon(
                                      Icons.downloading,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(height: height(15)),
                        SizedBox(
                          height: height(56),
                          width: width(327),
                          child: ElevatedButton(
                              style: buttonStyle(
                                  color: Colors.white,
                                  circular: 5,
                                  shadow: true),
                              onPressed: () {
                                //Get.to(() => const LaporanViewJembatan());
                                launchUrl(
                                    Uri.parse(
                                      "https://sleman.wastuanopama.com/jembatan/jembatan_laporan",
                                    ),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width(17)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Laporan Jembatan',
                                      style: textStyle(width(18),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const Icon(
                                      Icons.downloading,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
