import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/admin/views/widget/signin_screen.dart';

import '../../../global/utils/constants/asset_const.dart';
import '../../../global/utils/constants/stain_const.dart';
import '../../../global/utils/helper.dart';
import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
            backgroundColor: GlobalStain.bg.withOpacity(0.9),
            body: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
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
                  Positioned(
                    top: 45,
                    child: SizedBox(
                        height: 255.0,
                        width: 229.0,
                        child: Image.asset(
                          AssetSplash.loggo,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        height: height(520),
                        width: width(375),
                        decoration: boxDecoration(
                            color: Colors.white, top: true, radius: 25),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width(45)),
                          child: const SignInScreen(),
                        )),
                  )
                ]))));
  }
}
