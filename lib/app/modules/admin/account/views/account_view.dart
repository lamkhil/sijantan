import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../../global/utils/constants/asset_const.dart';
import '../../../../global/utils/constants/stain_const.dart';
import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        body: Stack(children: [
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
            ),
          ),
          Positioned(
            top: height(180),
            child: Container(
              height: height(700),
              width: widthFull(),
              decoration: BoxDecoration(
                color: Palette.toDark.shade50,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height(60),
                  ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.person,
                  //     size: 30.sp,
                  //     color: Colors.blue,
                  //   ),
                  //   title: Text("Informasi Akun",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 14.sp,
                  //       )),
                  //   trailing: Icon(
                  //     Icons.arrow_forward_ios,
                  //     size: 15.sp,
                  //   ),
                  // ),
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.lock,
                  //     size: 30.sp,
                  //     color: Colors.orange,
                  //   ),
                  //   title: Text("Ubah Kata Sandi",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 14.sp,
                  //       )),
                  //   trailing: Icon(
                  //     Icons.arrow_forward_ios,
                  //     size: 15.sp,
                  //   ),
                  // ),
                  ListTile(
                    onTap: () {
                      Get.until((route) => Get.currentRoute == Routes.PUBLIC);
                    },
                    leading: Icon(
                      Icons.logout,
                      size: 30.sp,
                      color: Colors.red,
                    ),
                    title: Text("Keluar",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        )),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: height(120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Container(
                  height: height(105),
                  width: width(327),
                  decoration: boxDecoration(
                      color: Colors.white, radius: 10, shadow: false),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          controller.user.avatar ?? '',
                          excludeFromSemantics: true,
                          isAntiAlias: true,
                          color: Colors.black,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/image/user.png',
                              excludeFromSemantics: true,
                              isAntiAlias: true,
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.user.nama ?? '',
                              style: TextStyle(
                                color: const Color(0xff0F77BF),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              )),
                          Text("Admin",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              )),
                          SizedBox(height: height(5)),
                          Text("07-Nov-2022 12:58:05",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              )),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
