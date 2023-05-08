import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sijantan2/app/global/controller/core_controller.dart';
import 'package:sijantan2/main.dart';

import '../../../../global/utils/helper.dart';
import '../controllers/peta_controller.dart';

class PetaView extends GetView<PetaController> {
  const PetaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Stack(alignment: Alignment.center, children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: FlutterMap(
              options: MapOptions(
                enableScrollWheel: false,
                maxZoom: 25.0,
                minZoom: 11.0,
                absorbPanEventsOnScrollables: false,
                enableMultiFingerGestureRace: false,
                center: LatLng(-7.797068, 110.370529),
                zoom: 12,
              ),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  retinaMode: true,
                  userAgentPackageName: 'com.wastuanopama.sleman.sijantan2',
                ),
                TappablePolylineLayer(
                    // Will only render visible polylines, increasing performance
                    polylineCulling: true,
                    pointerDistanceTolerance: 20,
                    polylines: controller.coloredPolylines,
                    onTap: (polylines, tapPosition) =>
                        controller.selectJalan(polylines),
                    onMiss: (tapPosition) {
                      controller.clearPop();
                    }),
                Obx(() {
                  var selected = controller.selectedJembatan.value;
                  return MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 30,
                      size: const Size(40, 40),
                      anchor: AnchorPos.align(AnchorAlign.center),
                      fitBoundsOptions: const FitBoundsOptions(
                        padding: EdgeInsets.all(50),
                        maxZoom: 15,
                      ),
                      markers: List.generate(
                          Get.find<CoreController>().jembatanDetail.length,
                          (index) {
                        var data =
                            Get.find<CoreController>().jembatanDetail[index];
                        return Marker(
                          point: LatLng(
                            double.parse(data.latitude!),
                            double.parse(data.longitude!),
                          ),
                          rotateAlignment: Alignment.center,
                          rotate: true,
                          width: selected?.iD == data.iD ? 80.sp : 40.sp,
                          height: selected?.iD == data.iD ? 80.sp : 40.sp,
                          builder: (context) => InkWell(
                            onTap: () {
                              controller.selectJembatan(data);
                            },
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: kondisiColor(int.parse(
                                    Get.find<CoreController>()
                                            .kondisiJembatanGroupedByTahun[
                                                defaultDataYear.toString()]
                                                ?[index]
                                            .nK ??
                                        '0')),
                                size: selected?.iD == data.iD ? 40.sp : 20.sp,
                              ),
                            ),
                          ),
                        );
                      }),
                      builder: (context, markers) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple.withOpacity(0.7)),
                          child: Center(
                            child: Text(
                              markers.length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Obx(() => controller.selectedPoly.value != null
                    ? TappablePolylineLayer(
                        // Will only render visible polylines, increasing performance
                        polylineCulling: true,
                        pointerDistanceTolerance: 20,
                        polylines: controller.selectedPoly.value!
                            .map((e) => TaggedPolyline(
                                  tag: "",
                                  // An optional tag to distinguish polylines in callback
                                  borderColor: Colors.black,
                                  borderStrokeWidth: 0.9,
                                  points: e.points,
                                  color: e.color,
                                  strokeWidth: 5.0,
                                ))
                            .toList(),
                        // List.generate(
                        //     controller.selectedJalan.value!.kondisiJalan!
                        //         .length, (index) {
                        //   var data = controller
                        //       .selectedJalan.value!.kondisiJalan![index];
                        //   var percent = data.values.first /
                        //       controller.selectedJalan.value!.kondisiJalan!
                        //           .map((e) => e.values.reduce(
                        //               (value, element) => value + element))
                        //           .reduce((value, element) => value + element);
                        //   var max = (percent *
                        //           controller.selectedPoly.value!.points.length)
                        //       .round();
                        //   var ltlng = <LatLng>[];
                        //   for (var i = controller.generated.length;
                        //       i < (controller.generated.length) + max;
                        //       i++) {
                        //     if (i <
                        //         controller.selectedPoly.value!.points.length) {
                        //       ltlng.add(
                        //           controller.selectedPoly.value!.points[i]);
                        //     }
                        //   }

                        //   controller.generated.addAll(
                        //       List.generate(ltlng.length, (index) => 1));
                        //   return TaggedPolyline(
                        //     tag: "",
                        //     // An optional tag to distinguish polylines in callback
                        //     borderColor: Colors.black,
                        //     borderStrokeWidth: 0.9,
                        //     points: ltlng,
                        //     color: kondisiColorString(data.keys.first),
                        //     strokeWidth: 5.0,
                        //   );
                        // }),
                        onTap: (polylines, tapPosition) {
                          controller.clearPop();
                        },
                        onMiss: (tapPosition) {
                          controller.clearPop();
                        })
                    : const SizedBox.shrink())
              ],
            ),
          ),
          Positioned(
              top: height(59),
              left: width(30),
              child: SizedBox(
                width: 50,
                child: ElevatedButton(
                    style: buttonStyle(color: Colors.white, shadow: true),
                    onPressed: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              )),
          Obx(
            () => AnimatedPositioned(
              bottom: controller.selectedJalan.value != null ? 30.h : -300.h,
              duration: const Duration(milliseconds: 300),
              child: popUpDetailJalan(),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              bottom: controller.selectedJembatan.value != null ? 30.h : -300.h,
              duration: const Duration(milliseconds: 300),
              child: popUpDetailJembatan(),
            ),
          )
        ]),
      ),
    );
  }

  SizedBox popUpDetailJalan() {
    return SizedBox(
      height: 200.h,
      width: 360.w,
      child: SizedBox(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height(177),
          width: width(327),
          decoration: boxDecoration(color: Colors.white, radius: width(12)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(13)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Jalan",
                  style: textStyle(width(14),
                      color: Colors.black, weight: FontWeight.w700),
                ),
                ListTile(
                  // leading: SizedBox(
                  //   height: height(60),
                  //   width: width(60),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(5),
                  //     child: controller.selectedJalan.value != null
                  //         ? (controller.selectedJalan.value!.photo1
                  //                     ?.isImageFileName ??
                  //                 false)
                  //             ? CachedNetworkImage(
                  //                 imageUrl:
                  //                     controller.selectedJalan.value!.photo1 ??
                  //                         '',
                  //                 memCacheHeight: 60,
                  //                 memCacheWidth: 60,
                  //                 height: height(60),
                  //                 width: width(60),
                  //                 useOldImageOnUrlChange: false,
                  //                 progressIndicatorBuilder:
                  //                     (context, url, progress) {
                  //                   return Padding(
                  //                       padding: EdgeInsets.all(16.r),
                  //                       child: Center(
                  //                           child: AspectRatio(
                  //                         aspectRatio: 1,
                  //                         child: CircularProgressIndicator(
                  //                           value: progress.totalSize != null
                  //                               ? (progress.downloaded /
                  //                                   num.parse(progress.totalSize
                  //                                       .toString()))
                  //                               : null,
                  //                         ),
                  //                       )));
                  //                 },
                  //                 errorWidget: (context, url, error) {
                  //                   return Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     color: Colors.red,
                  //                   );
                  //                 },
                  //                 fit: BoxFit.cover,
                  //               )
                  //             : const SizedBox.shrink()
                  //         : SizedBox.fromSize(),
                  //   ),
                  // ),
                  title: Text(
                    controller.selectedJalan.value?.nmRuas ?? '',
                    style: textStyle(width(14),
                        color: Colors.black, weight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "${controller.selectedJalan.value?.hotmix ?? ''} KM",
                    style: textStyle(width(14),
                        color: Colors.black, weight: FontWeight.w500),
                  ),
                  trailing: Text(controller.selectedJalan.value?.tahun ?? ''),
                ),
                SizedBox(height: height(5)),
                const Divider(
                  height: 2,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.green,
                      child: Text(
                        "${controller.selectedJalan.value?.baik ?? 0} KM",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.yellow.shade600,
                      child: Text(
                        "${controller.selectedJalan.value?.sedang ?? 0}  KM",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.orange,
                      child: Text(
                        "${controller.selectedJalan.value?.rusakRingan ?? 0}  KM",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.red,
                      child: Text(
                        "${controller.selectedJalan.value?.rusakBerat ?? 0}  KM",
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ],
                ),
                const Divider(
                  height: 2,
                ),
                SizedBox(height: height(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height(41),
                        child: ElevatedButton(
                            style: buttonStyle(circular: 5, color: Colors.blue),
                            onPressed: () => controller.redirectDetail(),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                                SizedBox(width: width(20)),
                                Text(
                                  'Detail',
                                  style: textStyle(width(14),
                                      color: Colors.white,
                                      weight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: height(41),
                        child: ElevatedButton(
                            style: buttonStyle(circular: 5, color: Colors.blue),
                            onPressed: () => controller.redirectMap(),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.telegram,
                                  color: Colors.white,
                                ),
                                SizedBox(width: width(20)),
                                Text(
                                  'Arahkan',
                                  style: textStyle(width(14),
                                      color: Colors.white,
                                      weight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  SizedBox popUpDetailJembatan() {
    return SizedBox(
      height: 200.h,
      width: 360.w,
      child: SizedBox(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height(177),
          width: width(327),
          decoration: boxDecoration(color: Colors.white, radius: width(12)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(13)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Jembatan",
                  style: textStyle(width(14),
                      color: Colors.black, weight: FontWeight.w700),
                ),
                ListTile(
                  // leading: SizedBox(
                  //   height: height(60),
                  //   width: width(60),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(5),
                  //     child: controller.selectedJalan.value != null
                  //         ? (controller.selectedJalan.value!.photo1
                  //                     ?.isImageFileName ??
                  //                 false)
                  //             ? CachedNetworkImage(
                  //                 imageUrl:
                  //                     controller.selectedJalan.value!.photo1 ??
                  //                         '',
                  //                 memCacheHeight: 60,
                  //                 memCacheWidth: 60,
                  //                 height: height(60),
                  //                 width: width(60),
                  //                 useOldImageOnUrlChange: false,
                  //                 progressIndicatorBuilder:
                  //                     (context, url, progress) {
                  //                   return Padding(
                  //                       padding: EdgeInsets.all(16.r),
                  //                       child: Center(
                  //                           child: AspectRatio(
                  //                         aspectRatio: 1,
                  //                         child: CircularProgressIndicator(
                  //                           value: progress.totalSize != null
                  //                               ? (progress.downloaded /
                  //                                   num.parse(progress.totalSize
                  //                                       .toString()))
                  //                               : null,
                  //                         ),
                  //                       )));
                  //                 },
                  //                 errorWidget: (context, url, error) {
                  //                   return Container(
                  //                     height: 60,
                  //                     width: 60,
                  //                     color: Colors.red,
                  //                   );
                  //                 },
                  //                 fit: BoxFit.cover,
                  //               )
                  //             : const SizedBox.shrink()
                  //         : SizedBox.fromSize(),
                  //   ),
                  // ),
                  title: Text(
                    "${controller.selectedJembatan.value?.noJbt ?? ''} - ${controller.selectedJembatan.value?.nmRuas ?? ''}",
                    style: textStyle(width(14),
                        color: Colors.black, weight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    controller.selectedJembatan.value?.nmJbt ?? '',
                    style: textStyle(width(14),
                        color: Colors.black, weight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: height(5)),
                const Divider(
                  height: 2,
                ),
                Row(
                  children: [
                    const Text("Kondisi :"),
                    const Spacer(),
                    Text(kondisiString(Get.find<CoreController>()
                            .kondisiJembatanGroupedByID[
                                controller.selectedJembatan.value?.iD]
                            ?.nK ??
                        ''))
                  ],
                ),
                const Divider(
                  height: 2,
                ),
                SizedBox(height: height(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height(41),
                        child: ElevatedButton(
                            style: buttonStyle(circular: 5, color: Colors.blue),
                            onPressed: () => controller.redirectDetail(),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                                SizedBox(width: width(20)),
                                Text(
                                  'Detail',
                                  style: textStyle(width(14),
                                      color: Colors.white,
                                      weight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: height(41),
                        child: ElevatedButton(
                            style: buttonStyle(circular: 5, color: Colors.blue),
                            onPressed: () => controller.redirectMap(),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.telegram,
                                  color: Colors.white,
                                ),
                                SizedBox(width: width(20)),
                                Text(
                                  'Arahkan',
                                  style: textStyle(width(14),
                                      color: Colors.white,
                                      weight: FontWeight.w500),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
