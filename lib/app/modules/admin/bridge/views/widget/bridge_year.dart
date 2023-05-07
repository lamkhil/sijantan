import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import "package:latlong2/latlong.dart";
import 'package:sijantan2/app/data/models/detail_spreadsheet_response.dart';
import 'package:sijantan2/app/data/models/jembatan_detail.dart';
import 'package:sijantan2/app/modules/admin/bridge/controllers/bridge_controller.dart';
import 'package:sijantan2/app/modules/public/jembatan/detail_jembatan/controllers/detail_jembatan_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';

class BridgeYear extends GetView<BridgeController> {
  const BridgeYear({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BridgeController>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Palette.toDark.shade50,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: height(49),
                width: width(327),
                decoration: boxDecoration(
                    color: Colors.white, radius: 10, border: true),
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode()),
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
            SizedBox(height: height(8)),
            controller.obx((state) => Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state!.length,
                      itemBuilder: (context, i) {
                        Jembatan bridge = state[i];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: height(11)),
                          child: SizedBox(
                            height: height(180),
                            width: width(327),
                            child: ElevatedButton(
                                style: buttonStyle(
                                    circular: 10,
                                    color: Colors.white,
                                    shadow: true),
                                onPressed: () {
                                  Get.toNamed(Routes.DETAIL_JEMBATAN,
                                      arguments: DetailJembatanArgument(
                                          iD: bridge.iD!, jembatan: bridge));
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: height(11)),
                                    SizedBox(
                                      height: height(92),
                                      width: width(291),
                                      child: AbsorbPointer(
                                        absorbing: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: FlutterMap(
                                            options: MapOptions(
                                              enableScrollWheel: false,
                                              absorbPanEventsOnScrollables:
                                                  false,
                                              enableMultiFingerGestureRace:
                                                  false,
                                              center: LatLng(
                                                  double.parse(
                                                      bridge.latitude!),
                                                  double.parse(
                                                      bridge.longitude!)),
                                              zoom: 13.2,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                retinaMode: true,
                                                userAgentPackageName:
                                                    'com.wastuanopama.sleman.sijantan2',
                                              ),
                                              MarkerLayer(
                                                markers: [
                                                  Marker(
                                                      point: LatLng(
                                                          double.parse(
                                                              bridge.latitude!),
                                                          double.parse(bridge
                                                              .longitude!)),
                                                      width: 80,
                                                      height: 80,
                                                      builder: (context) =>
                                                          const FaIcon(
                                                              FontAwesomeIcons
                                                                  .locationPin,
                                                              color:
                                                                  Colors.cyan)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height(11)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(bridge.nmJbt!,
                                              style: textStyle(width(14),
                                                  color: Colors.black,
                                                  weight: FontWeight.w600)),
                                          Text(bridge.noJbt!,
                                              style: textStyle(width(12),
                                                  color: Colors.black,
                                                  weight: FontWeight.w500))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(bridge.nmRuas!,
                                            style: textStyle(12,
                                                color: Colors.black,
                                                weight: FontWeight.w600)),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                              "${bridge.latitude}, ${bridge.longitude} ",
                                              style: textStyle(10,
                                                  color: Colors.black,
                                                  weight: FontWeight.w500)),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                )))
          ],
        ),
      ),
    );
  }
}
