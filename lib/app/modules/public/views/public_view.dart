import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/global/widget/dialog_izin.dart';
import 'package:sijantan2/app/global/widget/loading_dialog.dart';
import 'package:sijantan2/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/controller/core_controller.dart';
import '../../../global/utils/constants/asset_const.dart';
import '../../../global/utils/constants/stain_const.dart';
import '../../../global/utils/helper.dart';
import '../../../global/utils/pallete.dart';
import '../controllers/public_controller.dart';

class PublicView extends GetView<PublicController> {
  const PublicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                    height: 225,
                    width: 300,
                    child: Image.asset(
                      AssetSplash.pattern1,
                      fit: BoxFit.cover,
                    ))),
            Positioned(
                top: 113,
                left: 0,
                child: SizedBox(
                    height: 245,
                    child: Image.asset(
                      AssetSplash.pattern2,
                    ))),
            Positioned(
              top: 0,
              child: Container(
                height: height(250),
                width: widthFull(),
                color: GlobalStain.bg.withOpacity(0.9),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: width(16), horizontal: width(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height(60)),
                          Text(
                            'Selamat Datang',
                            style: textStyle(width(14),
                                color: Colors.white, weight: FontWeight.w300),
                          ),
                          SizedBox(height: height(10)),
                          Text(
                            'SIJANTAN-Sistem Informasi Jalan\ndan Jembatan Kabupaten Sleman',
                            style: textStyle(18,
                                color: Colors.white, weight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height(180),
              child: Container(
                height: height(700),
                width: widthFull(),
                decoration: boxDecoration(
                  top: true,
                  radius: 25,
                  color: Palette.toDark.shade50,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: height(191),
                        width: widthFull(),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: height(191),
                              width: widthFull(),
                              child: PageView.builder(
                                  itemCount: Get.find<CoreController>()
                                          .detailData
                                          .value
                                          ?.banner
                                          ?.length ??
                                      0,
                                  controller: controller.pageController,
                                  itemBuilder: (context, rampage) {
                                    final data = Get.find<CoreController>()
                                        .detailData
                                        .value
                                        ?.banner?[rampage];
                                    return InkWell(
                                      onTap: () {
                                        launchUrl(
                                            Uri.parse(data.redirectLink ?? ''));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width(16)),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: height(191),
                                              width: width(350),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color: Colors.transparent,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          data!.link!))),
                                            ),
                                            Positioned(
                                              bottom: height(8),
                                              child: Opacity(
                                                opacity: 0.7,
                                                child: Container(
                                                  height: height(61),
                                                  width: width(327),
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: boxDecoration(
                                                      color: Colors.white,
                                                      radius: 4),
                                                  child: Text(
                                                    '${data.title}\n${data.subtitle}',
                                                    textAlign: TextAlign.left,
                                                    style: textStyle(16,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 24, 99, 160),
                                                        weight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Positioned(
                                top: height(9),
                                right: width(30),
                                child: SizedBox(
                                  height: 10,
                                  child: SmoothPageIndicator(
                                    controller: controller
                                        .pageController, // PageController
                                    count: 3,
                                    effect: const WormEffect(
                                        dotHeight: 9,
                                        dotWidth: 9,
                                        activeDotColor: Colors.blue,
                                        dotColor: Colors
                                            .white), // your preferred effect
                                  ),
                                ))
                          ],
                        )),
                    SizedBox(
                      height: height(42),
                      child: Padding(
                        padding: EdgeInsets.only(left: width(22)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Menu',
                            style: textStyle(width(16),
                                color: Colors.black, weight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width(20)),
                      child: SizedBox(
                        height: height(140),
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            SizedBox(
                                height: height(61),
                                width: width(71),
                                child: ElevatedButton(
                                    style: buttonStyle(
                                        color: Colors.white, circular: 8),
                                    onPressed: () async {
                                      Get.toNamed(Routes.PETA);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: height(26.0),
                                            width: width(26.0),
                                            child: Image.asset(
                                              AssetHome.peta,
                                            )),
                                        SizedBox(height: height(6)),
                                        Text("Peta",
                                            style: textStyle(width(8),
                                                color: Colors.black,
                                                weight: FontWeight.w600)),
                                      ],
                                    ))),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.JALAN),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.jalan,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Jalan",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.JEMBATAN),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.jembatan,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Jembatan",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.KEGIATAN),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.kegiatan,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Kegiatan",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.GRAFIK),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.grafik,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Grafik",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.LAPORAN),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.laporan,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Laporan",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => DialogIzin.izinDialog(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.perizinan,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Perizinan",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(61),
                              width: width(71),
                              child: ElevatedButton(
                                style: buttonStyle(
                                    color: Colors.white, circular: 8),
                                onPressed: () => Get.toNamed(Routes.ADMIN),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: height(26.0),
                                        width: width(26.0),
                                        child: Image.asset(
                                          AssetHome.admin,
                                        )),
                                    SizedBox(height: height(6)),
                                    Text("Admin",
                                        style: textStyle(width(8),
                                            color: Colors.black,
                                            weight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(42),
                      child: Padding(
                        padding: EdgeInsets.only(left: width(22)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Informasi Menarik',
                            style: textStyle(width(16),
                                color: Colors.black, weight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: widthFull(),
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: width(22)),
                                child: SizedBox(
                                  height: height(74),
                                  width: width(343),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: buttonStyle(color: Colors.white),
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: height(30),
                                          width: width(30),
                                          child: Image.asset(
                                            AssetHome.panjangjalan,
                                          ),
                                        ),
                                        title: Text(
                                          'Panjang Jalan',
                                          style: textStyle(width(14),
                                              color: Colors.black,
                                              weight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          "Kabupaten Sleman",
                                          style: textStyle(13,
                                              color: Colors.black,
                                              weight: FontWeight.w400),
                                        ),
                                        trailing: Text(
                                          "699,50 KM",
                                          style: textStyle(width(20),
                                              color: Colors.black,
                                              weight: FontWeight.w500),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: width(22)),
                                child: SizedBox(
                                  height: height(74),
                                  width: width(343),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: buttonStyle(color: Colors.white),
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: height(30),
                                          width: width(30),
                                          child: Image.asset(
                                            AssetHome.jembatan,
                                          ),
                                        ),
                                        title: Text(
                                          'Jembatan',
                                          style: textStyle(width(14),
                                              color: Colors.black,
                                              weight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          "Kabupaten Sleman",
                                          style: textStyle(13,
                                              color: Colors.black,
                                              weight: FontWeight.w400),
                                        ),
                                        trailing: Text(
                                          "${controller.lastBridge.length}",
                                          style: textStyle(width(20),
                                              color: Colors.black,
                                              weight: FontWeight.w500),
                                        ),
                                      )),
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
