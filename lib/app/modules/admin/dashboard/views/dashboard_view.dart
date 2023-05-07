import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/admin/account/views/account_view.dart';
import 'package:sijantan2/app/modules/admin/bridge/views/bridge_view.dart';
import 'package:sijantan2/app/modules/admin/dashboard/views/widget/interface_all.dart';
import 'package:sijantan2/app/modules/admin/dashboard/views/widget/interface_detail.dart';
import 'package:sijantan2/app/modules/admin/road/views/road_view.dart';

import '../../../../global/utils/constants/asset_const.dart';
import '../../../../global/utils/constants/stain_const.dart';
import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';
import '../../../../global/widget/indicator.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.currentIndex.value = 3;
        return false;
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _DashboardView(),
              const RoadView(),
              const BridgeView(),
              const AccountView()
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: (val) {
              controller.currentIndex.value = val;
            },
            elevation: 12,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xff0F77BF),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHome.menu,
                  height: 20,
                  width: 20,
                  color:
                      controller.currentIndex.value == 0 ? Colors.black : null,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHome.jalan,
                  height: 20,
                  width: 20,
                  color:
                      controller.currentIndex.value == 1 ? Colors.black : null,
                ),
                label: 'Jalan',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetHome.jembatan,
                  height: 20,
                  width: 20,
                  color:
                      controller.currentIndex.value == 2 ? Colors.black : null,
                ),
                label: 'Jembatan',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 24.sp,
                  color: controller.currentIndex.value == 3
                      ? Colors.black
                      : const Color(0xff0F77BF),
                ),
                label: 'Akun',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final component = {
      {
        "asset": AssetHome.jalan,
        "title": "Panjang Jalan (km)",
        "satuan": "699.5"
      },
      {"asset": AssetHome.jembatan, "title": "Jembatan", "satuan": "708"},
      {"asset": AssetAdmin.tumbsup, "title": "Mantap", "satuan": "89%"},
      {"asset": AssetAdmin.tumbsdown, "title": "Tidak Mantap", "satuan": "11%"},
    };
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.toDark.shade50,
        body: SingleChildScrollView(
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: controller.index.isFalse ? height(1150) : height(3130),
              child: SizedBox(
                width: double.maxFinite,
                height: height(1800),
                child: Stack(
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
                                  SizedBox(height: height(65)),
                                  Text(
                                    'Hi Doni Kabayan,',
                                    style: textStyle(14,
                                        color: Colors.white,
                                        weight: FontWeight.w300),
                                  ),
                                  Text(
                                    'Selamat Datang',
                                    style: textStyle(width(18),
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: height(61.0),
                                  width: width(71.0),
                                  child: Image.asset(
                                    AssetSplash.loggo,
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: height(180),
                        child: Container(
                          width: widthFull(),
                          decoration: boxDecoration(
                              top: true,
                              radius: 25,
                              color: Palette.toDark.shade50,
                              shadow: false),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(height: height(13)),
                              SizedBox(
                                  child: Column(
                                children: component
                                    .map((element) => Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height(10)),
                                          child: Container(
                                            height: height(105),
                                            width: width(327),
                                            decoration: boxDecoration(
                                                color: Colors.white,
                                                radius: 17),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Center(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                          height: height(43.0),
                                                          width: width(43.0),
                                                          child: Image.asset(
                                                            element
                                                                .values.first,
                                                            fit: BoxFit.cover,
                                                          )),
                                                      SizedBox(
                                                          width: width(133.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                element.values
                                                                    .elementAt(
                                                                        1),
                                                                style: textStyle(
                                                                    width(12),
                                                                    color: Colors
                                                                        .black,
                                                                    weight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                element.values
                                                                    .elementAt(
                                                                        2),
                                                                style: textStyle(
                                                                    width(32),
                                                                    color: Colors
                                                                        .black,
                                                                    weight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                            ],
                                                          )),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              )),
                              SizedBox(height: height(10)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width(24)),
                                child: Container(
                                    height: height(50),
                                    width: widthFull(),
                                    decoration: boxDecoration(
                                        radius: 10, color: Colors.white),
                                    child: TabBar(
                                        onTap: (value) => controller
                                                .tabController.index
                                                .isEqual(0)
                                            ? controller.index.value = false
                                            : controller.index.value = true,
                                        controller: controller.tabController,
                                        indicator: BubbleTabIndicator(
                                          padding: EdgeInsets.symmetric(
                                              vertical: width(6),
                                              horizontal: 0),
                                          indicatorColor:
                                              Palette.toDark.shade100,
                                          indicatorRadius: width(10),
                                        ),
                                        tabs: [
                                          SizedBox(
                                              width: width(166),
                                              child: Center(
                                                child: Text("Semua",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.sp,
                                                    )),
                                              )),
                                          SizedBox(
                                              width: width(166),
                                              child: Center(
                                                child: Text("Tahun 2021",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.sp,
                                                    )),
                                              )),
                                          SizedBox(
                                              width: width(166),
                                              child: Center(
                                                child: Text("Tahun 2022",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.sp,
                                                    )),
                                              ))
                                        ])),
                              ),
                              SizedBox(height: height(20)),
                              Container(
                                  height: height(2300),
                                  width: widthFull(),
                                  decoration: boxDecoration(
                                      color: Palette.toDark.shade50,
                                      radius: 17),
                                  child: TabBarView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: controller.tabController,
                                      children: [
                                        const InterfaceAll(),
                                        const InterfaceDetail(),
                                        const InterfaceDetail(),
                                      ])),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
