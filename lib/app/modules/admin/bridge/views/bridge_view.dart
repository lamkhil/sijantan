import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/admin/bridge/views/widget/bridge_occasion.dart';
import 'package:sijantan2/app/modules/admin/bridge/views/widget/bridge_year.dart';

import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';
import '../../../../global/widget/indicator.dart';
import '../controllers/bridge_controller.dart';

class BridgeView extends GetView<BridgeController> {
  const BridgeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Palette.toDark.shade50,
        resizeToAvoidBottomInset: false,
        extendBody: false,
        body: Column(children: [
          SizedBox(
            width: widthFull(),
            child: Column(
              children: [
                SizedBox(height: height(60)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      Text(
                        'Informasi Jembatan',
                        style: textStyle(20,
                            color: Colors.black, weight: FontWeight.w700),
                      ),
                      const SizedBox(width: 50)
                    ],
                  ),
                ),
                SizedBox(height: height(15)),
              ],
            ),
          ),
          SizedBox(height: height(10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(24)),
            child: Container(
                height: height(50),
                width: widthFull(),
                decoration: boxDecoration(radius: 10, color: Colors.white),
                child: TabBar(
                    controller: controller.tabControllerOcasion,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    indicator: BubbleTabIndicator(
                      padding: EdgeInsets.symmetric(
                          vertical: width(6), horizontal: 0),
                      indicatorColor: Palette.toDark.shade100,
                      indicatorRadius: width(10),
                    ),
                    tabs: [
                      SizedBox(
                          width: width(166),
                          child: Center(
                            child: Text("Data Jembatan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                )),
                          )),
                      SizedBox(
                          width: width(166),
                          child: Center(
                            child: Text("Kondisi Jembatan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                )),
                          )),
                    ])),
          ),
          SizedBox(height: height(15)),
          SizedBox(
            width: widthFull(),
            height: height(530),
            child: TabBarView(
                controller: controller.tabControllerOcasion,
                children: const [BridgeYear(), BridgeOcasion()]),
          )
        ]),
      ),
    );
  }
}
