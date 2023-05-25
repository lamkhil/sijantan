import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:sijantan2/app/modules/public/jalan/detail_jalan/views/widget/photo_view.dart';
import 'package:sijantan2/app/modules/public/jembatan/detail_jembatan/controllers/detail_jembatan_controller.dart';
import 'package:sijantan2/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../global/controller/core_controller.dart';
import '../../../../../global/utils/helper.dart';
import '../controllers/detail_jalan_controller.dart';

class DetailJalanView extends GetView<DetailJalanController> {
  const DetailJalanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.obx((state) => Text(state?.nmRuas ?? 'Detail Jalan'),
            onError: (error) => const Text("Detail Jalan"),
            onLoading: const Text("Detail Jalan"),
            onEmpty: const Text("Detail Jalan")),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          mapView(),
          Padding(
            padding: EdgeInsets.all(18.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                informasiUmum(),
                SizedBox(
                  height: 16.h,
                ),
                informasiLokasi(),
                SizedBox(
                  height: 16.h,
                ),
                (Get.find<CoreController>()
                            .jembatanDetailGroupByRuas[
                                controller.argument.noRuas]
                            ?.isNotEmpty ??
                        false)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Informasi Jembatan",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          ...Get.find<CoreController>()
                              .jembatanDetailGroupByRuas[
                                  controller.argument.noRuas]!
                              .map(
                            (e) {
                              return Container(
                                height: 75.h,
                                margin: EdgeInsets.only(bottom: 12.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 8)
                                    ],
                                    color: Colors.white),
                                child: ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_JEMBATAN,
                                        arguments: DetailJembatanArgument(
                                            iD: e.iD!, jembatan: e));
                                  },
                                  title: Text(
                                    e.noJbt ?? '',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: Text(
                                    e.nmJbt ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing:
                                      const Icon(CupertinoIcons.right_chevron),
                                ),
                              );
                            },
                          ).toList(),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                informasiKondisi()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: height(54),
              child: ElevatedButton(
                style: buttonStyle(color: Colors.blue),
                onPressed: () {
                  launchUrlString(
                      "https://maps.google.com/?q=${Get.find<CoreController>().jalanDetailGroupByRuas[controller.argument.noRuas]?.latAwal},${Get.find<CoreController>().jalanDetailGroupByRuas[controller.argument.noRuas]?.lonAwal}",
                      mode: LaunchMode.externalApplication);
                }, //=> controller.linked(map.Coords(-7.749133, 110.488999), "KLURAK"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Arahkan Kelokasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        )),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  SizedBox mapView() {
    return SizedBox(
      height: 267.h,
      width: 1.sw,
      child: Stack(
        children: [
          Positioned.fill(
            child: FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                enableScrollWheel: false,
                absorbPanEventsOnScrollables: false,
                enableMultiFingerGestureRace: false,
                boundsOptions: const FitBoundsOptions(
                    padding: EdgeInsets.all(12),
                    inside: false,
                    forceIntegerZoomLevel: true),
                bounds: LatLngBounds(
                    LatLng(
                      double.tryParse(Get.find<CoreController>()
                                  .jalanDetailGroupByRuas[
                                      controller.argument.noRuas]!
                                  .latAwal ??
                              '') ??
                          0,
                      double.tryParse(Get.find<CoreController>()
                                  .jalanDetailGroupByRuas[
                                      controller.argument.noRuas]!
                                  .lonAwal ??
                              '') ??
                          0,
                    ),
                    LatLng(
                      double.tryParse(Get.find<CoreController>()
                                  .jalanDetailGroupByRuas[
                                      controller.argument.noRuas]!
                                  .latAkhir ??
                              '') ??
                          0,
                      double.tryParse(Get.find<CoreController>()
                                  .jalanDetailGroupByRuas[
                                      controller.argument.noRuas]!
                                  .lonAkhir ??
                              '') ??
                          0,
                    )),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  retinaMode: true,
                  userAgentPackageName: 'com.wastuanopama.sleman.sijantan2',
                ),
                TappablePolylineLayer(
                  polylineCulling: true,
                  pointerDistanceTolerance: 20,
                  polylines: controller.selectedPoly,
                  onTap: (polylines, tapPosition) {
                    controller.information.value =
                        json.decode(polylines.first.tag.toString());
                    controller.showInformation.value =
                        !controller.showInformation.value;
                  },
                  onMiss: (tapPosition) {
                    controller.showInformation.value = false;
                    controller.information.value = null;
                  },
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        width: 40.w,
                        height: 60.h,
                        point: LatLng(
                          double.tryParse(Get.find<CoreController>()
                                      .jalanDetailGroupByRuas[
                                          controller.argument.noRuas]!
                                      .latAwal ??
                                  '') ??
                              0,
                          double.tryParse(Get.find<CoreController>()
                                      .jalanDetailGroupByRuas[
                                          controller.argument.noRuas]!
                                      .lonAwal ??
                                  '') ??
                              0,
                        ),
                        builder: (_) => Column(
                              children: [
                                Text(
                                  "Pangkal",
                                  style: TextStyle(fontSize: 7.sp),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.green,
                                  size: 20.sp,
                                ),
                              ],
                            )),
                    Marker(
                        width: 40.w,
                        height: 60.h,
                        point: LatLng(
                          double.tryParse(Get.find<CoreController>()
                                      .jalanDetailGroupByRuas[
                                          controller.argument.noRuas]!
                                      .latAkhir ??
                                  '') ??
                              0,
                          double.tryParse(Get.find<CoreController>()
                                      .jalanDetailGroupByRuas[
                                          controller.argument.noRuas]!
                                      .lonAkhir ??
                                  '') ??
                              0,
                        ),
                        builder: (_) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Ujung",
                                  style: TextStyle(fontSize: 7.sp),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                              ],
                            )),
                  ],
                ),
                MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                  markers: [
                    ...Get.find<CoreController>()
                            .jembatanDetailGroupByRuas[
                                controller.argument.noRuas]
                            ?.map((e) => Marker(
                                width: 40.w,
                                height: 60.h,
                                point: LatLng(double.parse(e.latitude!),
                                    double.parse(e.longitude!)),
                                builder: (_) {
                                  return Column(
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          e.nmJbt ?? '',
                                          style: TextStyle(fontSize: 7.sp),
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.locationPin,
                                        color: Colors.red,
                                        size: 20.sp,
                                      ),
                                    ],
                                  );
                                }))
                            .toList() ??
                        []
                  ],
                  builder: (BuildContext context, List<Marker> markers) {
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
                )),
                Obx(() => controller.showInformation.value
                    ? MarkerLayer(
                        markers: [
                          Marker(
                              width: 80.w,
                              height: 150.h,
                              point: LatLng(
                                  controller.information.value!['latitude'],
                                  controller.information.value!['longitude']),
                              builder: (_) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      bottom: 75.h,
                                      child: FaIcon(
                                        FontAwesomeIcons.locationPin,
                                        color:
                                            Get.theme.scaffoldBackgroundColor,
                                        size: 20.sp,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      child: SizedBox(
                                        height: 75.h,
                                        child: Card(
                                          elevation: 0,
                                          color:
                                              Get.theme.scaffoldBackgroundColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0.r),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kondisi Jalan",
                                                  style:
                                                      TextStyle(fontSize: 8.sp),
                                                ),
                                                Text(
                                                  controller.information
                                                      .value!['kondisi'],
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "",
                                                  style:
                                                      TextStyle(fontSize: 3.sp),
                                                ),
                                                Text(
                                                  "Panjang",
                                                  style:
                                                      TextStyle(fontSize: 8.sp),
                                                ),
                                                Text(
                                                  controller.information
                                                      .value!['panjang'],
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              })
                        ],
                      )
                    : const SizedBox.shrink())
              ],
            ),
          ),
          Positioned(
              top: 15.h,
              right: 15.w,
              child: Container(
                height: 110.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.mapController.move(
                                controller.mapController.center,
                                ++controller.currentZoom);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 20.sp,
                          )),
                      const Divider(),
                      IconButton(
                          onPressed: () {
                            controller.mapController.move(
                                controller.mapController.center,
                                --controller.currentZoom);
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 20.sp,
                          ))
                    ]),
              )),
        ],
      ),
    );
  }

  Column informasiKondisi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Informasi Kondisi",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Expanded(
              child: Obx(
                () => DropdownSearch(
                  selectedItem: controller.tahun.value.toString(),
                  items: const ['2022', '2021'],
                  popupProps: const PopupProps.menu(
                      constraints: BoxConstraints(maxHeight: 125)),
                  onChanged: (value) {
                    controller.tahun.value = int.parse(value!);
                    controller.getData();
                  },
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        controller.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  itemInformasi(key: "Baik", value: "${state?.baik ?? ''} KM"),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Sedang", value: "${state?.sedang ?? ''} KM"),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  itemInformasi(
                      key: "Rusak Ringan",
                      value: "${state?.rusakRingan ?? ''} KM"),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Rusak Berat",
                      value: "${state?.rusakBerat ?? ''} KM"),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Tipe Perkerasan",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  itemInformasi(
                      key: "Hotmix", value: "${state?.hotmix ?? ''} KM"),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Penetrasi/Makadam",
                      value: "${state?.aspal ?? ''} "),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  itemInformasi(key: "Beton", value: "${state?.beton ?? ''} "),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Kerikil", value: "${state?.kerikil ?? ''} "),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  itemInformasi(key: "Tanah", value: "${state?.tanah ?? '-'} "),
                  SizedBox(
                    width: 12.r,
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Foto",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 3,
                ),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => PhotoJalanView(
                          url: state.toJson()["photo${index + 1}"]));
                    },
                    child: CachedNetworkImage(
                      imageUrl: state!.toJson()["photo${index + 1}"],
                      progressIndicatorBuilder: (context, url, progress) {
                        print("${progress.downloaded}/${progress.totalSize}");
                        return Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Center(
                                child: AspectRatio(
                              aspectRatio: 1,
                              child: CircularProgressIndicator(
                                value: progress.totalSize != null
                                    ? (progress.downloaded /
                                        num.parse(
                                            progress.totalSize.toString()))
                                    : null,
                              ),
                            )));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          onLoading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ),
          onError: (error) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error ?? 'Server Error',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }

  Column informasiLokasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Lokasi",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            itemInformasi(
                key: "Kapanewon",
                value: Get.find<CoreController>()
                        .jalanDetailGroupByRuas[controller.argument.noRuas]
                        ?.kec ??
                    ''),
            SizedBox(
              width: 12.r,
            ),
            itemInformasi(
                key: "Pangkal",
                value: Get.find<CoreController>()
                        .jalanDetailGroupByRuas[controller.argument.noRuas]
                        ?.pangkal ??
                    ''),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            itemInformasi(
                key: "Ujung",
                value: Get.find<CoreController>()
                        .jalanDetailGroupByRuas[controller.argument.noRuas]
                        ?.ujung ??
                    ''),
            SizedBox(
              width: 12.r,
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }

  Column informasiUmum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informasi Umum",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            itemInformasi(key: "No Ruas", value: controller.argument.noRuas),
            SizedBox(
              width: 12.r,
            ),
            itemInformasi(
                key: "Nama Ruas Jalan",
                value: controller.argument.jalan.nmRuas ?? ''),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            itemInformasi(
                key: "Panjang (KM)",
                value: "${controller.argument.jalan.hotmix ?? ''} KM"),
            SizedBox(
              width: 12.r,
            ),
            itemInformasi(
                key: "Lebar (m)",
                value:
                    "${Get.find<CoreController>().jalanDetailGroupByRuas[controller.argument.noRuas]?.lebar ?? ''} m"),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          children: [
            itemInformasi(
                key: "Fungsi",
                value: Get.find<CoreController>()
                        .jalanDetailGroupByRuas[controller.argument.noRuas]
                        ?.fungsi ??
                    ''),
            SizedBox(
              width: 12.r,
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  Expanded itemInformasi({required String key, required String value}) {
    return Expanded(
        child: Container(
      height: 75.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8)
          ],
          color: Colors.white),
      child: ListTile(
        title: Text(
          key,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
