import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../../../global/controller/core_controller.dart';
import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';
import '../../controllers/road_controller.dart';

class RoadAll extends GetView<RoadController> {
  const RoadAll({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.toDark.shade50,
      resizeToAvoidBottomInset: false,
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
                          hintText: "Cari Data Jalan")),
                ),
              ),
            ),
          ),
          SizedBox(height: height(10)),
          controller.obx((state) {
            return Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    var data = state[i];
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: height(11)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height(75),
                              width: width(327),
                              child: ElevatedButton(
                                  style: buttonStyle(
                                      circular: 10,
                                      color: Colors.white,
                                      shadow: true),
                                  onPressed: () {
                                    Get.toNamed(Routes.EDIT_INFORMASI_JALAN,
                                        arguments: Get.find<CoreController>()
                                                .jalanDetailGroupByRuas[
                                            data.noRuas]!);
                                  },
                                  child: ListTile(
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
                                              child: Text(data.noRuas ?? '',
                                                  style: const TextStyle(
                                                      color: Color(0xff1D3A70),
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            )),
                                      ],
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 0),
                                    title: Text(data.nmRuas ?? '',
                                        style: textStyle(width(14),
                                            color: const Color(0xff1D3A70),
                                            weight: FontWeight.w600)),
                                    subtitle: Text(
                                        "Panjang ${data.hotmix ?? '0'} KM ",
                                        style: textStyle(width(12),
                                            color: const Color(0xff1D3A70),
                                            weight: FontWeight.w500)),
                                    trailing: FaIcon(
                                      FontAwesomeIcons.penToSquare,
                                      color: Colors.indigo,
                                      size: width(20.0),
                                    ),
                                  )),
                            ),
                          ],
                        ));
                  }),
            );
          })
        ],
      ),
    );
  }
}
