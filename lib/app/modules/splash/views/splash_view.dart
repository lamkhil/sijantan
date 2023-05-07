import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../global/utils/constants/asset_const.dart';
import '../../../global/utils/constants/stain_const.dart';
import '../../../global/utils/helper.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: GlobalStain.bg.withOpacity(0.9),
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
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
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                      height: 245,
                      child: Image.asset(
                        AssetSplash.pattern,
                      ))),
              Obx(() => AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: controller.loader.value ? 225 : 328,
                    child: SizedBox(
                        height: 255.0,
                        width: 229.0,
                        child: Image.asset(
                          AssetSplash.loggo,
                          fit: BoxFit.cover,
                        )),
                  )),
              Obx(() => Positioned(
                    bottom: controller.loader.value ? 0 : 50.0,
                    child: controller.loader.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: controller.loader.value ? height(330) : 0,
                            child: Container(
                              height: height(300),
                              width: width(375),
                              decoration: boxDecoration(
                                  color: Colors.white, top: true, radius: 25),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width(45)),
                                child: Column(
                                  children: [
                                    SizedBox(height: height(47)),
                                    Text("Sistem Informasi Jalan dan Jembatan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w800)),
                                    SizedBox(height: height(14)),
                                    Text(
                                        "Jl. Magelang Km.10, Tridadi, Sleman, Daerah Istimewa Yogyakarta, 55511",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w200)),
                                    SizedBox(height: height(33)),
                                    SizedBox(
                                        height: height(54),
                                        width: width(286),
                                        child: ElevatedButton(
                                          style: buttonStyle(
                                              color: GlobalStain.bg),
                                          onPressed: () =>
                                              Get.offAndToNamed(Routes.PUBLIC),
                                          child: Text("Get Started",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white)),
                                        )),
                                    SizedBox(height: height(20)),
                                  ],
                                ),
                              ),
                            ))
                        : const SizedBox(
                            height: 32.0,
                            width: 32,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
