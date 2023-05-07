import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../global/utils/helper.dart';
import '../../../jalan/detail_jalan/views/widget/photo_view.dart';
import '../controllers/detail_jembatan_controller.dart';

class DetailJembatanView extends GetView<DetailJembatanController> {
  const DetailJembatanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.obx(
            (state) => Text(state?.nmJbt ?? 'Detail Jembatan'),
            onError: (error) => const Text("Detail Jembatan"),
            onLoading: const Text("Detail Jembatan"),
            onEmpty: const Text("Detail Jembatan")),
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
                Text(
                  "Informasi Umum",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(children: [
                  itemInformasi(
                      key: "No Jembatan",
                      value: controller.argument.jembatan.noJbt ?? ''),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Tahun Pembuatan",
                      value: controller.argument.jembatan.tahunPemb ?? ''),
                ]),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    itemInformasi(
                        key: "Nama Jembatan",
                        value: controller.argument.jembatan.nmJbt ?? ''),
                    SizedBox(
                      width: 12.r,
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Informasi Lokasi",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(children: [
                  itemInformasi(
                      key: "Kapanewon",
                      value: controller.argument.jembatan.kecamatan ?? ''),
                  SizedBox(
                    width: 12.r,
                  ),
                  itemInformasi(
                      key: "Nama Ruas Jalan",
                      value: controller.argument.jembatan.nmRuas ?? ''),
                ]),
                SizedBox(
                  height: 12.h,
                ),
                Row(children: [
                  itemInformasi(
                      key: "Koordinat",
                      value:
                          "${controller.argument.jembatan.latitude ?? ''}, ${controller.argument.jembatan.longitude ?? ''}"),
                  SizedBox(
                    width: 12.r,
                  ),
                  const Spacer(),
                ]),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Text(
                      "Informasi Kondisi",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
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
                controller.obx((state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dimensi",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Panjang",
                              value: "${state!.panjang ?? '0'} m"),
                          SizedBox(
                            width: 12.r,
                          ),
                          itemInformasi(
                              key: "Lebar", value: "${state.lebar ?? '0'} m"),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Bentang",
                              value: "${state.jmlBentang ?? '0'} m"),
                          SizedBox(
                            width: 12.r,
                          ),
                          const Spacer(),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Struktur Bangunan Atas",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Tipe", value: "${state.tipeStr ?? '0'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          itemInformasi(
                              key: "Bahan", value: "${state.bhnStr ?? '0'} "),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Kondisi", value: "${state.kdsStr ?? '-'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          const Spacer(),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Lantai",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Bahan 1", value: "${state.bhn1Lt ?? '0'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          itemInformasi(
                              key: "Bahan 2", value: "${state.bhn2Lt ?? '0'} "),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Kondisi", value: "${state.kdsLt ?? '-'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          const Spacer(),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Sandaran",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Bahan 1",
                              value: "${state.bhn1San ?? '0'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          itemInformasi(
                              key: "Bahan 2",
                              value: "${state.bhn2San ?? '0'} "),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Kondisi", value: "${state.kdsSan ?? '-'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          const Spacer(),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Kepala Jembatan Pilar",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Tipe", value: "${state.kpTipe ?? '0'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          itemInformasi(
                              key: "Bahan", value: "${state.kpBhn ?? '0'} "),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Kondisi", value: "${state.kpKon ?? '-'} "),
                          SizedBox(
                            width: 12.r,
                          ),
                          const Spacer(),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Kondisi",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Nilai Kondisi",
                              value:
                                  "${state.nK ?? '-'} (${kondisiString(state.nK ?? '')})"),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Kerusakan",
                              value:
                                  "${state.kerusakan1 ?? '0'}, ${state.kerusakan2} ",
                              maxLines: 8,
                              wrap: false),
                        ]),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(children: [
                          itemInformasi(
                              key: "Penanganan",
                              value: state.penanganan ?? '-',
                              maxLines: 8,
                              wrap: false),
                        ]),
                        SizedBox(
                          height: 16.h,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Foto",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        state.foto == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Tidak ada foto tersedia")
                                ],
                              )
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 3,
                                ),
                                shrinkWrap: true,
                                itemCount: state.foto?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => PhotoJalanView(
                                          url:
                                              "${state.url_foto!}/${state.iD}/${state.foto![index]}"));
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${state.url_foto!}/${state.iD}/${state.foto![index]}",
                                      progressIndicatorBuilder:
                                          (context, url, progress) {
                                        print(
                                            "${progress.downloaded}/${progress.totalSize}");
                                        return Padding(
                                            padding: EdgeInsets.all(16.r),
                                            child: Center(
                                                child: AspectRatio(
                                              aspectRatio: 1,
                                              child: CircularProgressIndicator(
                                                value:
                                                    progress.totalSize != null
                                                        ? (progress.downloaded /
                                                            num.parse(progress
                                                                .totalSize
                                                                .toString()))
                                                        : null,
                                              ),
                                            )));
                                      },
                                    ),
                                  );
                                },
                              ),
                      ],
                    )),
                SizedBox(
                  height: height(54),
                  width: width(327),
                  child: ElevatedButton(
                    style: buttonStyle(color: Colors.blue),
                    onPressed: () {
                      launchUrlString(
                        "https://maps.google.com/?q=${controller.argument.jembatan.latitude},${controller.argument.jembatan.longitude}",
                      );
                    }, //=> controller.linked(map.Coords(-7.749133, 110.488999), "KLURAK"),
                    child: Text("Arahkan Kelokasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        )),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Expanded itemInformasi(
      {required String key,
      required String value,
      int? maxLines = 1,
      bool wrap = true}) {
    return Expanded(
        child: Container(
      height: wrap ? 75.h : null,
      padding:
          !wrap ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h) : null,
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
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
      ),
    ));
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
                  center: LatLng(
                      double.tryParse(
                              controller.argument.jembatan.latitude ?? '') ??
                          0,
                      double.tryParse(
                              controller.argument.jembatan.longitude ?? '') ??
                          0)),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  retinaMode: true,
                  userAgentPackageName: 'com.wastuanopama.sleman.sijantan2',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        width: 40.w,
                        height: 60.h,
                        point: LatLng(
                            double.tryParse(
                                    controller.argument.jembatan.latitude ??
                                        '') ??
                                0,
                            double.tryParse(
                                    controller.argument.jembatan.longitude ??
                                        '') ??
                                0),
                        builder: (_) => Column(
                              children: [
                                Text(
                                  "${controller.argument.jembatan.nmJbt}",
                                  style: TextStyle(fontSize: 7.sp),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: Colors.blue,
                                  size: 20.sp,
                                ),
                              ],
                            )),
                  ],
                ),
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
                            controller.currentZoom.value += 0.3;
                            controller.mapController.move(
                                controller.mapController.center,
                                controller.currentZoom.value);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 20.sp,
                          )),
                      const Divider(),
                      IconButton(
                          onPressed: () {
                            controller.currentZoom.value -= 0.3;
                            controller.mapController.move(
                                controller.mapController.center,
                                controller.currentZoom.value);
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

  // Column informasiKondisi() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           Text(
  //             "Informasi Kondisi",
  //             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //           ),
  //           const Spacer(),
  //           Expanded(
  //             child: Obx(
  //               () => DropdownSearch(
  //                 selectedItem: controller.tahun.value.toString(),
  //                 items: List.generate(
  //                     10, (index) => (DateTime.now().year - index).toString()),
  //                 onChanged: (value) {
  //                   controller.tahun.value = int.parse(value!);
  //                   controller.getData();
  //                 },
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //       controller.obx(
  //         (state) => Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Row(
  //               children: [
  //                 itemInformasi(key: "Baik", value: "${state?.baik ?? ''} KM"),
  //                 SizedBox(
  //                   width: 12.r,
  //                 ),
  //                 itemInformasi(
  //                     key: "Sedang", value: "${state?.sedang ?? ''} KM"),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 12.h,
  //             ),
  //             Row(
  //               children: [
  //                 itemInformasi(
  //                     key: "Rusak Ringan",
  //                     value: "${state?.rusakRingan ?? ''} KM"),
  //                 SizedBox(
  //                   width: 12.r,
  //                 ),
  //                 itemInformasi(
  //                     key: "Rusak Berat",
  //                     value: "${state?.rusakBerat ?? ''} KM"),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 16.h,
  //             ),
  //             Text(
  //               "Tipe Perkerasan",
  //               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 16.h,
  //             ),
  //             Row(
  //               children: [
  //                 itemInformasi(
  //                     key: "Hotmix", value: "${state?.hotmix ?? ''} KM"),
  //                 SizedBox(
  //                   width: 12.r,
  //                 ),
  //                 itemInformasi(
  //                     key: "Penetrasi/Makadam",
  //                     value: "${state?.aspal ?? ''} "),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 12.h,
  //             ),
  //             Row(
  //               children: [
  //                 itemInformasi(key: "Beton", value: "${state?.beton ?? ''} "),
  //                 SizedBox(
  //                   width: 12.r,
  //                 ),
  //                 itemInformasi(
  //                     key: "Kerikil", value: "${state?.kerikil ?? ''} "),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 12.h,
  //             ),
  //             Row(
  //               children: [
  //                 itemInformasi(key: "Tanah", value: "${state?.tanah ?? '-'} "),
  //                 SizedBox(
  //                   width: 12.r,
  //                 ),
  //                 const Spacer()
  //               ],
  //             ),
  //             SizedBox(
  //               height: 16.h,
  //             ),
  //             Text(
  //               "Foto",
  //               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 16.h,
  //             ),
  //             GridView.builder(
  //               physics: const NeverScrollableScrollPhysics(),
  //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisSpacing: 0,
  //                 mainAxisSpacing: 0,
  //                 crossAxisCount: 3,
  //               ),
  //               shrinkWrap: true,
  //               itemCount: 6,
  //               itemBuilder: (context, index) {
  //                 return InkWell(
  //                   onTap: () {
  //                     Get.to(() => PhotoJalanView(
  //                         url: state.toJson()["photo${index + 1}"]));
  //                   },
  //                   child: CachedNetworkImage(
  //                     imageUrl: state!.toJson()["photo${index + 1}"],
  //                     progressIndicatorBuilder: (context, url, progress) {
  //                       print("${progress.downloaded}/${progress.totalSize}");
  //                       return Padding(
  //                           padding: EdgeInsets.all(16.r),
  //                           child: Center(
  //                               child: AspectRatio(
  //                             aspectRatio: 1,
  //                             child: CircularProgressIndicator(
  //                               value: progress.totalSize != null
  //                                   ? (progress.downloaded /
  //                                       num.parse(
  //                                           progress.totalSize.toString()))
  //                                   : null,
  //                             ),
  //                           )));
  //                     },
  //                   ),
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //         onLoading: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: const [CircularProgressIndicator()],
  //         ),
  //         onError: (error) => Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               error ?? 'Server Error',
  //               textAlign: TextAlign.center,
  //             ),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //     ],
  //   );
  // }

  // Column informasiLokasi() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Informasi Lokasi",
  //         style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //       Row(
  //         children: [
  //           itemInformasi(
  //               key: "Kecamatan",
  //               value: Get.find<CoreController>()
  //                       .jalanDetailGroupByRuas[controller.argument.noRuas]
  //                       ?.kec ??
  //                   ''),
  //           SizedBox(
  //             width: 12.r,
  //           ),
  //           itemInformasi(
  //               key: "Pangkal",
  //               value: Get.find<CoreController>()
  //                       .jalanDetailGroupByRuas[controller.argument.noRuas]
  //                       ?.pangkal ??
  //                   ''),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 12.h,
  //       ),
  //       Row(
  //         children: [
  //           itemInformasi(
  //               key: "Ujung",
  //               value: Get.find<CoreController>()
  //                       .jalanDetailGroupByRuas[controller.argument.noRuas]
  //                       ?.ujung ??
  //                   ''),
  //           SizedBox(
  //             width: 12.r,
  //           ),
  //           const Spacer(),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //     ],
  //   );
  // }

  // Column informasiUmum() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Informasi Umum",
  //         style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //       Row(
  //         children: [
  //           itemInformasi(key: "No Ruas", value: controller.argument.noRuas),
  //           SizedBox(
  //             width: 12.r,
  //           ),
  //           itemInformasi(
  //               key: "Nama Ruas Jalan",
  //               value: controller.argument.jalan.nmRuas ?? ''),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 12.h,
  //       ),
  //       Row(
  //         children: [
  //           itemInformasi(
  //               key: "Panjang (KM)",
  //               value: "${controller.argument.jalan.hotmix ?? ''} KM"),
  //           SizedBox(
  //             width: 12.r,
  //           ),
  //           itemInformasi(
  //               key: "Lebar (m)",
  //               value:
  //                   "${Get.find<CoreController>().jalanDetailGroupByRuas[controller.argument.noRuas]?.lebar ?? ''} m"),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 12.h,
  //       ),
  //       Row(
  //         children: [
  //           itemInformasi(
  //               key: "Fungsi",
  //               value: Get.find<CoreController>()
  //                       .jalanDetailGroupByRuas[controller.argument.noRuas]
  //                       ?.fungsi ??
  //                   ''),
  //           SizedBox(
  //             width: 12.r,
  //           ),
  //           const Spacer(),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Expanded itemInformasi({required String key, required String value}) {
  //   return Expanded(
  //       child: Container(
  //     height: 75.h,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(12.r),
  //         boxShadow: [
  //           BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8)
  //         ],
  //         color: Colors.white),
  //     child: ListTile(
  //       title: Text(
  //         key,
  //         style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
  //       ),
  //       subtitle: Text(
  //         value,
  //         maxLines: 1,
  //         overflow: TextOverflow.ellipsis,
  //         style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   ));
  // }
}
