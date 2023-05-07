import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';

class InterfaceDetail extends StatelessWidget {
  const InterfaceDetail({super.key});
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Baik 568.2": 81.2,
      "Sedang\n64.35 km": 9.2,
      "Rusak berat\n17,7 km": 7.0,
      "Rusak Ringan\n49,25km": 2.5,
    };

    List<Color> colorList = [
      const Color(0xff0F77BF),
      Colors.yellow,
      Colors.brown,
      Colors.red,
    ];
    return Scaffold(
      backgroundColor: Palette.toDark.shade50,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: Container(
                height: height(550),
                width: width(400),
                decoration: boxDecoration(color: Colors.white, radius: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 25.0, left: 14),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Kondisi Jalan',
                          style: textStyle(14,
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w600),
                        ),
                      ),
                    ),
                    PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 52,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: -100,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      centerText: "2021",
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: false,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        chartValueBackgroundColor: Colors.white,
                        chartValueStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.black),
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 1,
                      ),
                    ),
                    SizedBox(height: height(20)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff8FD3F4),
                              Color(0xff84FAB0),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Baik',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffFDA085),
                              Color(0xffF6D365),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sedang',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffF78CA0),
                              Color(0xffF9748F),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rusak Ringan',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffBDBBBE),
                              Color(0xff9D9EA3),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rusak berat',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(height: height(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: Container(
                height: height(400),
                width: width(400),
                decoration: boxDecoration(color: Colors.white, radius: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 25.0, left: 14),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Kemantapan',
                          style: textStyle(14,
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w600),
                        ),
                      ),
                    ),
                    PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 52,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 1,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      centerText: "82.3% total",
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: false,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        chartValueBackgroundColor: Colors.white,
                        chartValueStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.black),
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 1,
                      ),
                    ),
                    SizedBox(height: height(20)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff8FD3F4),
                              Color(0xff84FAB0),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mantap',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(56),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffF78CA0),
                              Color(0xffF9748F),
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tidak Mantap',
                              style: textStyle(width(12),
                                  color: Colors.white, weight: FontWeight.w400),
                            ),
                            Text(
                              '568.2 Km',
                              style: textStyle(width(14),
                                  color: Colors.white, weight: FontWeight.w400),
                            )
                          ],
                        ),
                        trailing: Text(
                          '81.23 %',
                          style: textStyle(width(12),
                              color: Colors.white, weight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                  ],
                )),
          ),
          SizedBox(height: height(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: Container(
                height: height(850),
                width: width(400),
                decoration: boxDecoration(color: Colors.white, radius: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 25.0, left: 14),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Kondisi Jembatan',
                          style: textStyle(14,
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w600),
                        ),
                      ),
                    ),
                    PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 52,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 1,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      centerText: "82.3% total",
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: false,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        chartValueBackgroundColor: Colors.white,
                        chartValueStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.black),
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 1,
                      ),
                    ),
                    SizedBox(height: height(20)),
                    Container(
                        height: height(100),
                        width: width(293),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 4),
                                  blurRadius: 5,
                                  color: Palette.toDark.shade100),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '-',
                                        style: textStyle(width(12),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Jumlah Jembatan',
                                        style: textStyle(width(10),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      ),
                                      Text(
                                        '4',
                                        style: textStyle(width(14),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Baik',
                                        style: textStyle(width(12),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Presentase',
                                        style: textStyle(width(10),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      ),
                                      Text(
                                        '24.93 %',
                                        style: textStyle(width(14),
                                            color: Colors.black,
                                            weight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(84),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '-',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Jumlah Jembatan',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '4',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Baik',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Presentase',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '24.93 %',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(84),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '-',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Jumlah Jembatan',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '4',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Baik',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Presentase',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '24.93 %',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(84),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '-',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Jumlah Jembatan',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '4',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Baik',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Presentase',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '24.93 %',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(84),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '-',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Jumlah Jembatan',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '4',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Baik',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Presentase',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '24.93 %',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height(10)),
                    Container(
                      height: height(84),
                      width: width(293),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(3, 4),
                                blurRadius: 5,
                                color: Palette.toDark.shade100),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '-',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Jumlah Jembatan',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '4',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Baik',
                                      style: textStyle(width(12),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Presentase',
                                      style: textStyle(width(10),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    ),
                                    Text(
                                      '24.93 %',
                                      style: textStyle(width(14),
                                          color: Colors.black,
                                          weight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(height: height(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rekomendasi Program Penanganan',
                style: textStyle(width(14),
                    color: const Color(0xff1A1A1A), weight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: height(15)),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: width(327),
                  decoration: boxDecoration(radius: 5, color: Colors.white),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '4',
                        style: textStyle(width(14),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w500),
                      ),
                    ),
                    title: Text(
                      'Rusak Ringan',
                      style: textStyle(width(14),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Pemeliharaan Rutin / Berkala',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w400),
                    ),
                    trailing: Text(
                      '24.86 %',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: width(327),
                  decoration: boxDecoration(radius: 5, color: Colors.white),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '9',
                        textAlign: TextAlign.center,
                        style: textStyle(width(14),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w500),
                      ),
                    ),
                    title: Text(
                      'Rusak',
                      style: textStyle(width(14),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Rehabilitasi',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w400),
                    ),
                    trailing: Text(
                      '45.48 %',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: width(327),
                  decoration: boxDecoration(radius: 5, color: Colors.white),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '9',
                        style: textStyle(width(14),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w500),
                      ),
                    ),
                    title: Text(
                      'Rusak Berat',
                      style: textStyle(width(14),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Rehabilitasi',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w400),
                    ),
                    trailing: Text(
                      '24.42 %',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: width(327),
                  decoration: boxDecoration(radius: 5, color: Colors.white),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '9',
                        style: textStyle(width(14),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w500),
                      ),
                    ),
                    title: Text(
                      'Kritis',
                      style: textStyle(width(14),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Penggantian',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w400),
                    ),
                    trailing: Text(
                      '2.82 %',
                      style: textStyle(width(12),
                          color: const Color(0xff1A1A1A),
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
