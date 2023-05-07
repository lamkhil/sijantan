import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/routes/app_pages.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../../global/utils/constants/stain_const.dart';
import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../../../../../global/widget/indicator.dart';
import '../../controllers/road_controller.dart';

class RoadOcasion extends GetView<RoadController> {
  const RoadOcasion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.toDark.shade50,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Container(
              height: height(49),
              width: width(327),
              decoration:
                  boxDecoration(color: Colors.white, radius: 10, border: true),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: width(280),
                  child: TextField(
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.multiline,
                      controller:
                          controller.roadOcasionController.searchController,
                      style: textStyle(14, weight: FontWeight.w400),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.grey),
                          icon: FaIcon(FontAwesomeIcons.magnifyingGlass,
                              color: Colors.grey, size: 20.sp),
                          suffix: GestureDetector(
                            onTap: () => {
                              FocusScope.of(context).requestFocus(FocusNode()),
                              // controller.filteredData.clear(),
                              controller.roadOcasionController.searchController
                                  .clear()
                            },
                            child: FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.grey,
                              size: 20.sp,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Cari Data Jalan")),
                ),
              ),
            ),
          ),
          SizedBox(height: height(10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(24)),
            child: Container(
              height: height(50),
              decoration: boxDecoration(radius: 10, color: Colors.white),
              child: TabBar(
                  controller:
                      controller.roadOcasionController.tabControllerYear,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  indicator: BubbleTabIndicator(
                    padding:
                        EdgeInsets.symmetric(vertical: width(6), horizontal: 0),
                    indicatorColor: Palette.toDark.shade100,
                    indicatorRadius: width(10),
                  ),
                  tabs: [
                    SizedBox(
                        width: width(166),
                        child: Center(
                          child: Text("2021",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              )),
                        )),
                    SizedBox(
                        width: width(166),
                        child: Center(
                          child: Text("2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              )),
                        ))
                  ]),
            ),
          ),
          SizedBox(height: height(10)),
          Expanded(
            child: TabBarView(
                controller: controller.roadOcasionController.tabControllerYear,
                children: [
                  controller.roadOcasionController.obx((state) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = state[i];
                          return Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height(11)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height(140),
                                    width: width(327),
                                    child: ElevatedButton(
                                        style: buttonStyle(
                                            circular: 10,
                                            color: Colors.white,
                                            shadow: true),
                                        onPressed: () {
                                          Get.toNamed(Routes.EDIT_KONSISI_JALAN,
                                              arguments: data);
                                        },
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.only(left: 0),
                                          leading: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 30.r,
                                                  height: 30.r,
                                                  padding: EdgeInsets.all(4.r),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kondisiColor(
                                                          data.kondisi ?? 0)),
                                                  child: FittedBox(
                                                    child: Text(
                                                        data.noRuas ?? '',
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff1D3A70),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  )),
                                            ],
                                          ),
                                          title: Text(data.nmRuas ?? '',
                                              style: textStyle(width(14),
                                                  color:
                                                      const Color(0xff1D3A70),
                                                  weight: FontWeight.w600)),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Panjang ${data.hotmix} Km",
                                                style: textStyle(width(12),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              SizedBox(height: height(14)),
                                              Text(
                                                'Kondisi (${data.tahun})',
                                                style: textStyle(width(12),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              SizedBox(height: height(5)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Baik',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.baik ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Sedang',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.sedang ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Rusak Ringan',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.rusakRingan ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Rusak Berat',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.rusakBerat ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: height(5)),
                                            ],
                                          ),
                                          trailing: FaIcon(
                                            FontAwesomeIcons.penToSquare,
                                            color: Colors.indigo,
                                            size: width(20.0),
                                          ),
                                        )),
                                  ),
                                ],
                              ));
                        });
                  }),
                  controller.roadOcasionController.obx((state) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = state[i];
                          return Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height(11)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height(140),
                                    width: width(327),
                                    child: ElevatedButton(
                                        style: buttonStyle(
                                            circular: 10,
                                            color: Colors.white,
                                            shadow: true),
                                        onPressed: () {
                                          Get.toNamed(Routes.EDIT_KONSISI_JALAN,
                                              arguments: data);
                                        },
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.only(left: 0),
                                          leading: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 30.r,
                                                  height: 30.r,
                                                  padding: EdgeInsets.all(4.r),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kondisiColor(
                                                          data.kondisi ?? 0)),
                                                  child: FittedBox(
                                                    child: Text(
                                                        data.noRuas ?? '',
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff1D3A70),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  )),
                                            ],
                                          ),
                                          title: Text(data.nmRuas ?? '',
                                              style: textStyle(width(14),
                                                  color:
                                                      const Color(0xff1D3A70),
                                                  weight: FontWeight.w600)),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Panjang ${data.hotmix} Km",
                                                style: textStyle(width(12),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              SizedBox(height: height(14)),
                                              Text(
                                                'Kondisi (${data.tahun})',
                                                style: textStyle(width(12),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              SizedBox(height: height(5)),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Baik',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.baik ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Sedang',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.sedang ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Rusak Ringan',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.rusakRingan ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Rusak Berat',
                                                        style: textStyle(
                                                            width(10),
                                                            color: const Color(
                                                                0xff1A1A1A),
                                                            weight: FontWeight
                                                                .w400),
                                                      ),
                                                      Text(
                                                        data.rusakBerat ?? '',
                                                        style: textStyle(
                                                            width(12),
                                                            color: BoardingStain
                                                                .button,
                                                            weight: FontWeight
                                                                .w700),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: height(5)),
                                            ],
                                          ),
                                          trailing: FaIcon(
                                            FontAwesomeIcons.penToSquare,
                                            color: Colors.indigo,
                                            size: width(20.0),
                                          ),
                                        )),
                                  ),
                                ],
                              ));
                        });
                  })
                ]),
          )
        ],
      ),
    );
  }
}
