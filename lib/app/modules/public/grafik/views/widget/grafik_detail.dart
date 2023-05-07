import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sijantan2/app/modules/public/grafik/controllers/grafik_controller.dart';

import '../../../../../global/utils/helper.dart';

class GrafikDetail extends GetView<GrafikController> {
  const GrafikDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Baik 568.2": 81.2,
      "Sedang\n64.35 km": 9.2,
      "Rusak Ringan\n49,25km": 7.0,
      "Rusak berat\n17,7 km": 2.5,
    };

    Map<String, double> dataJembatan = {
      "Baik: 4": 1.1,
      "Rusak sedang\n 161": 25,
      "Rusak berat\n 90": 45.7,
      "Kritis 9": 25.6,
      "runtuh 0 ": 2.6,
    };

    List<Color> colorListJembatan = [
      const Color(0xff0F77BF),
      Colors.yellow,
      const Color(0xffF75D5F),
      const Color.fromARGB(255, 148, 31, 22),
      Colors.brown
    ];

    List<Color> colorList = [
      const Color(0xff0F77BF),
      Colors.yellow,
      Colors.amber,
      Colors.red
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(30)),
              child: Container(
                  height: height(250),
                  width: width(400),
                  decoration: boxDecoration(color: Colors.white, radius: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 25.0),
                        child: Text(
                          'Kondisi Jalan',
                          style: textStyle(width(14),
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w600),
                        ),
                      ),
                      PieChart(
                        dataMap: dataMap,
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 52,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: colorList,
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 35,
                        centerText: "2021",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          chartValueStyle:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      ),
                    ],
                  )),
            ),
            SizedBox(height: height(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(30)),
              child: Container(
                  height: height(250),
                  width: width(348),
                  decoration: boxDecoration(color: Colors.white, radius: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 25.0),
                        child: Text(
                          'Kondisi Jembatan',
                          style: textStyle(width(14),
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w600),
                        ),
                      ),
                      PieChart(
                        dataMap: dataJembatan,
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 52,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: colorListJembatan,
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 35,
                        centerText: "2021",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          chartValueStyle:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      ),
                    ],
                  )),
            ),
            SizedBox(height: height(15)),
            Text(
              'Rekapitulasi Kondisi Jembatan Tahun 2021',
              style: textStyle(width(14),
                  color: const Color(0xff1A1A1A), weight: FontWeight.w600),
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
                        'Baik',
                        style: textStyle(width(14),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Pemeliharaan Berkala',
                        style: textStyle(width(12),
                            color: const Color(0xff1A1A1A),
                            weight: FontWeight.w400),
                      ),
                      trailing: Text(
                        '1.13 %',
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
                          '88',
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
                        '24.93 %',
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
                          '161',
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
                        '45.61 %',
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
                          '90',
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
                        '25.5 %',
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
                        '2.55 %',
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
                          '0',
                          style: textStyle(width(14),
                              color: const Color(0xff1A1A1A),
                              weight: FontWeight.w500),
                        ),
                      ),
                      title: Text(
                        'Runtuh',
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
                        '0 %',
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
      ),
    );
  }
}