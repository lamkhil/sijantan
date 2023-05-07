import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';
import 'package:sijantan2/app/modules/public/jalan/detail_jalan/controllers/detail_jalan_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';

import '../../../../global/utils/helper.dart';
import '../controllers/jalan_controller.dart';

class JalanView extends GetView<JalanController> {
  const JalanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                child: ElevatedButton(
                    style: buttonStyle(color: Colors.white, shadow: true),
                    onPressed: () => Get.back(),
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.black)),
              ),
              Text("Data Jalan",
                  style: textStyle(width(20),
                      color: Colors.black, weight: FontWeight.w700)),
              const SizedBox(width: 50)
            ],
          ),
          SizedBox(height: height(15)),
          Container(
            height: height(49),
            width: width(327),
            decoration:
                boxDecoration(color: Colors.white, radius: 10, border: true),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                  controller: controller.searchController,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.multiline,
                  style: textStyle(14, weight: FontWeight.w400),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      icon: FaIcon(FontAwesomeIcons.magnifyingGlass,
                          color: Colors.grey, size: 20.sp),
                      suffix: GestureDetector(
                        onTap: () => {
                          FocusScope.of(context).requestFocus(FocusNode()),
                          controller.searchController.clear()
                          // controller.filteredData.clear(),
                          // controller.search.value.clear()
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
          SizedBox(height: height(15)),
          controller.obx((state) {
            return Expanded(
              child: Obx(
                () {
                  var index = ((controller.currentPage.value - 1) * 10);
                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.currentPage.value - 1 ==
                              (Get.find<CoreController>().jalanDetail.length ~/
                                  10)
                          ? Get.find<CoreController>().jalanDetail.length % 10
                          : 10,
                      itemBuilder: (context, i) {
                        var data = state![index + i];
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
                                        Get.toNamed(Routes.DETAIL_JALAN,
                                            arguments: DetailJalanArgument(
                                                noRuas: data.noRuas ?? '',
                                                jalan: data));
                                      },
                                      child: ListTile(
                                        leading: CachedNetworkImage(
                                          imageUrl: data.photo1 ?? '',
                                          placeholder: (context, child) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 30.r,
                                                  width: 30.r,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                          width: 30.r,
                                                          height: 30.r,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.r),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: kondisiColor(
                                                                  data.kondisi ??
                                                                      0)),
                                                          child: FittedBox(
                                                            child: Text(
                                                                data.noRuas ??
                                                                    '',
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xff1D3A70),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          )),
                                                      const CircularProgressIndicator()
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          errorWidget:
                                              (context, error, stackTrace) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 30.r,
                                                    height: 30.r,
                                                    padding:
                                                        EdgeInsets.all(4.r),
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
                                            );
                                          },
                                        ),
                                        contentPadding:
                                            const EdgeInsets.only(left: 0),
                                        title: Text(data.nmRuas ?? '',
                                            style: textStyle(width(14),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w600)),
                                        subtitle: Text(
                                            "${Get.find<CoreController>().jembatanDetailGroupByRuas[data.noRuas]?.length ?? 0} Jembatan ",
                                            style: textStyle(width(12),
                                                color: const Color(0xff1D3A70),
                                                weight: FontWeight.w500)),
                                        trailing:
                                            const Icon(Icons.arrow_forward_ios),
                                      )),
                                ),
                              ],
                            ));
                      });
                },
              ),
            );
          }),
          Obx(
            () => Pagination(
              paginateButtonStyles: PaginateButtonStyles(),
              prevButtonStyles: PaginateSkipButton(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              nextButtonStyles: PaginateSkipButton(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              onPageChange: (number) {
                print(Get.find<CoreController>().jalanDetail.length / 10);
                controller.currentPage.value = number;
              },
              useGroup: true,
              totalPage: (Get.find<CoreController>().jalanDetail.length ~/ 10) +
                  (Get.find<CoreController>().jalanDetail.length % 10 > 0
                      ? 1
                      : 0),
              show: 3,
              currentPage: controller.currentPage.value,
            ),
          ),
          SizedBox(
            height: 12.h,
          )
        ],
      ),
    ));
  }
}
