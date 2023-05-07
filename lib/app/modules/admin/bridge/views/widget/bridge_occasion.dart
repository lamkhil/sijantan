import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/modules/admin/bridge/controllers/bridge_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../../../global/utils/constants/stain_const.dart';
import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../../../../../global/widget/indicator.dart';

class BridgeOcasion extends GetView<BridgeOcassionController> {
  const BridgeOcasion({super.key});

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
                      controller: controller.searchController,
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
                              controller.searchController.clear()
                            },
                            child: FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.grey,
                              size: 20.sp,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Cari Data Jembatan")),
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
                  controller: controller.tabControllerOcasion,
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
                controller: controller.tabControllerOcasion,
                children: [
                  controller.obx((state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var data = state[i];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: width(8.0)),
                              child: Container(
                                width: width(327),
                                decoration: boxDecoration(
                                    radius: 5, color: Colors.white),
                                child: ListTile(
                                  onTap: () {},
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data.noJbt} (${data.tahun})",
                                        style: textStyle(width(14),
                                            color: const Color(0xff1A1A1A),
                                            weight: FontWeight.w500),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.EDIT_KONDISI_JEMBATAN,
                                              arguments: data);
                                        },
                                        child: SizedBox(
                                          child: FaIcon(
                                            FontAwesomeIcons.penToSquare,
                                            color: Colors.indigo,
                                            size: width(20.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.nmRuas ?? '',
                                        style: textStyle(width(12),
                                            color: const Color(0xff1A1A1A),
                                            weight: FontWeight.bold),
                                      ),
                                      SizedBox(height: height(14)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Nilai Kondisi',
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                data.nK ?? "",
                                                style: textStyle(width(12),
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Kategori',
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                kondisiString(data.nK ?? ''),
                                                style: textStyle(width(12),
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rencana Penanganan",
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                data.penanganan ?? '',
                                                textAlign: TextAlign.center,
                                                style: textStyle(8,
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height(5)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }),
                  controller.obx((state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var data = state[i];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: width(8.0)),
                              child: Container(
                                width: width(327),
                                decoration: boxDecoration(
                                    radius: 5, color: Colors.white),
                                child: ListTile(
                                  onTap: () {},
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data.noJbt} (${data.tahun})",
                                        style: textStyle(width(14),
                                            color: const Color(0xff1A1A1A),
                                            weight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        child: FaIcon(
                                          FontAwesomeIcons.penToSquare,
                                          color: Colors.indigo,
                                          size: width(20.0),
                                        ),
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.nmRuas ?? '',
                                        style: textStyle(width(12),
                                            color: const Color(0xff1A1A1A),
                                            weight: FontWeight.bold),
                                      ),
                                      SizedBox(height: height(14)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Nilai Kondisi',
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                data.nK ?? "",
                                                style: textStyle(width(12),
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Kategori',
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                kondisiString(data.nK ?? ''),
                                                style: textStyle(width(12),
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rencana Penanganan",
                                                style: textStyle(width(10),
                                                    color:
                                                        const Color(0xff1A1A1A),
                                                    weight: FontWeight.w400),
                                              ),
                                              Text(
                                                data.penanganan ?? '',
                                                textAlign: TextAlign.center,
                                                style: textStyle(8,
                                                    color: BoardingStain.button,
                                                    weight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height(5)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  })
                ]),
          )
        ],
      ),
    );
  }
}
