import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/modules/public/kegiatan/views/widget/kegiatan_detail.dart';

import '../../../../global/utils/helper.dart';
import '../../../../global/utils/pallete.dart';
import '../../../../global/widget/indicator.dart';
import '../controllers/kegiatan_controller.dart';

class KegiatanView extends GetView<KegiatanController> {
  const KegiatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
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
                          style: buttonStyle(color: Colors.white, shadow: true),
                          onPressed: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                    ),
                    Text(
                      'Kegiatan',
                      style: textStyle(width(20),
                          color: Colors.black, weight: FontWeight.w700),
                    ),
                    const SizedBox(width: 50)
                  ],
                ),
              ),
              SizedBox(height: height(19)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(28)),
                child: Container(
                    height: height(50),
                    width: widthFull(),
                    decoration: boxDecoration(
                        radius: 10, color: Palette.toDark.shade50),
                    child: TabBar(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        controller: controller.tabController,
                        indicator: BubbleTabIndicator(
                          padding: EdgeInsets.symmetric(
                              vertical: width(6), horizontal: 0),
                          indicatorColor: Colors.white,
                          indicatorRadius: width(10),
                        ),
                        tabs: [
                          SizedBox(
                              width: width(166),
                              child: Center(
                                child: Text("Jalan",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    )),
                              )),
                          SizedBox(
                              width: width(166),
                              child: Center(
                                child: Text("Jembatan",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    )),
                              ))
                        ])),
              ),
              SizedBox(height: height(19)),
              SizedBox(
                height: height(530),
                width: widthFull(),
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height(60),
                          width: width(327),
                          decoration:
                              boxDecoration(color: Colors.white, radius: 10),
                          child: Row(
                            children: [
                              SizedBox(width: width(14)),
                              const Icon(Icons.search),
                              SizedBox(width: width(14)),
                              Text(
                                'Cari Data Jalan',
                                style: textStyle(width(14),
                                    color: Colors.grey.withOpacity(0.6),
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: height(11)),
                            child: SizedBox(
                              height: height(71),
                              width: width(327),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      circular: 10,
                                      color: Colors.white,
                                      shadow: true),
                                  onPressed: () => showModalBottomSheet(
                                      enableDrag: false,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return const FractionallySizedBox(
                                            heightFactor: 10,
                                            child: KegiatanDetail());
                                      }),
                                  child: ListTile(
                                    title: Text(
                                      'Jembatan Gantung',
                                      style: textStyle(width(14),
                                          color: const Color(0xff1D3A70),
                                          weight: FontWeight.w600),
                                    ),
                                    trailing: SizedBox(
                                      width: width(55),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '2022',
                                            style: textStyle(width(14),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w600),
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 20.sp),
                                        ],
                                      ),
                                    ),
                                  )),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: height(11)),
                            child: SizedBox(
                              height: height(71),
                              width: width(327),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      circular: 10,
                                      color: Colors.white,
                                      shadow: true),
                                  onPressed: () => showModalBottomSheet(
                                      enableDrag: false,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return const FractionallySizedBox(
                                            heightFactor: 10,
                                            child: KegiatanDetail());
                                      }),
                                  child: ListTile(
                                    title: Text(
                                      'Jembatan Gantung',
                                      style: textStyle(width(14),
                                          color: const Color(0xff1D3A70),
                                          weight: FontWeight.w600),
                                    ),
                                    trailing: SizedBox(
                                      width: width(55),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '2022',
                                            style: textStyle(width(14),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w600),
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 20.sp),
                                        ],
                                      ),
                                    ),
                                  )),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: height(49),
                          width: width(327),
                          decoration:
                              boxDecoration(color: Colors.white, radius: 10),
                          child: Row(
                            children: [
                              SizedBox(width: width(14)),
                              const Icon(Icons.search),
                              SizedBox(width: width(14)),
                              Text(
                                'Cari Data Jembatan',
                                style: textStyle(width(14),
                                    color: Colors.grey.withOpacity(0.6),
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: height(11)),
                            child: SizedBox(
                              height: height(71),
                              width: width(327),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      circular: 10,
                                      color: Colors.white,
                                      shadow: true),
                                  onPressed: () => showModalBottomSheet(
                                      enableDrag: false,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return const FractionallySizedBox(
                                            heightFactor: 10,
                                            child: KegiatanDetail());
                                      }),
                                  child: ListTile(
                                    title: Text(
                                      'Jembatan Gantung',
                                      style: textStyle(width(14),
                                          color: const Color(0xff1D3A70),
                                          weight: FontWeight.w600),
                                    ),
                                    trailing: SizedBox(
                                      width: width(55),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '2022',
                                            style: textStyle(width(14),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w600),
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 20.sp),
                                        ],
                                      ),
                                    ),
                                  )),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: height(11)),
                            child: SizedBox(
                              height: height(71),
                              width: width(327),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      circular: 10,
                                      color: Colors.white,
                                      shadow: true),
                                  onPressed: () => showModalBottomSheet(
                                      enableDrag: false,
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return const FractionallySizedBox(
                                            heightFactor: 10,
                                            child: KegiatanDetail());
                                      }),
                                  child: ListTile(
                                    title: Text(
                                      'Jembatan Gantung',
                                      style: textStyle(width(14),
                                          color: const Color(0xff1D3A70),
                                          weight: FontWeight.w600),
                                    ),
                                    trailing: SizedBox(
                                      width: width(55),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '2022',
                                            style: textStyle(width(14),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w600),
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 20.sp),
                                        ],
                                      ),
                                    ),
                                  )),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
