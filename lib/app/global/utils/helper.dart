import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sijantan2/app/global/utils/pallete.dart';

import 'constants/stain_const.dart';

double height(double val) => val.h;
double width(double val) => val.w;
double widthFull() => 1.sw;

Color kondisiColor(int index) {
  var color = [
    Colors.green,
    Colors.yellow.shade600,
    Colors.orange,
    Colors.red,
    Colors.brown,
    Colors.black
  ];
  return color[index];
}

Color kondisiColorString(String cond) {
  int index = 0;
  var color = [Colors.green, Colors.yellow.shade600, Colors.orange, Colors.red];
  if (cond == 'baik') {
    index = 0;
  } else if (cond == 'sedang') {
    index = 1;
  } else if (cond == 'rusak_sedang') {
    index = 2;
  } else {
    index = 3;
  }
  return color[index];
}

String kondisiString(String cond) {
  int index = int.tryParse(cond) ?? 10;
  String condition = '';
  if (index == 0) {
    condition = 'Baik';
  } else if (index == 1) {
    condition = 'Rusak Ringan';
  } else if (index == 2) {
    condition = 'Rusak Sedang';
  } else if (index == 3) {
    condition = 'Rusak Berat';
  } else {
    condition = "Kritis";
  }
  return condition;
}

Map<String, dynamic>? getJalan(Map data) {
  List result = data['val1']
      .where((element) => element['no_ruas'] == data['val2'])
      .toList();
  if (result.isEmpty) {
    return null;
  }
  return result.first;
}

boxDecoration(
        {Color? color,
        Color? topGrad,
        Color? bottomGrad,
        double? radius,
        bool? top,
        bool? bottom,
        bool? shadow,
        bool? border}) =>
    BoxDecoration(
      color: color,
      backgroundBlendMode: BlendMode.luminosity,
      border: border != null
          ? Border.all(color: Palette.toDark.shade50)
          : Border.all(color: Colors.transparent),
      borderRadius: top != null
          ? BorderRadius.vertical(top: Radius.circular(radius ?? 16.0))
          : bottom != null
              ? BorderRadius.vertical(bottom: Radius.circular(radius ?? 16))
              : BorderRadius.vertical(
                  top: Radius.circular(radius ?? 16),
                  bottom: Radius.circular(radius ?? 16)),
      gradient: topGrad != null && bottomGrad != null
          ? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [topGrad, bottomGrad],
            )
          : null,
      boxShadow: shadow != null
          ? null
          : [
              BoxShadow(
                  offset: const Offset(3, 4),
                  blurRadius: 5,
                  color: Palette.toDark.shade100),
            ],
    );
buttonStyle(
        {Color? color,
        double? top,
        double? circular,
        double? bottom,
        bool? shadow}) =>
    ButtonStyle(
        surfaceTintColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(6),
        visualDensity: VisualDensity.comfortable,
        shadowColor: shadow != null
            ? MaterialStateProperty.all(Colors.grey.withOpacity(0.2))
            : MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(Palette.toDark.shade50),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: top != null
                    ? BorderRadius.only(
                        topLeft: Radius.circular(top),
                        topRight: Radius.circular(top))
                    : bottom != null
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(bottom),
                            bottomRight: Radius.circular(bottom))
                        : BorderRadius.all(Radius.circular(circular ?? 10)))),
        backgroundColor:
            MaterialStateProperty.all(color ?? BoardingStain.button));

textStyle(double size,
        {Color? color,
        TextOverflow? overflow,
        FontWeight? weight,
        bool? underline}) =>
    TextStyle(
      color: color ?? BoardingStain.text,
      fontFamily: 'Poppins',
      overflow: overflow,
      fontSize: size.sp,
      fontWeight: weight,
      decorationColor: Colors.blue,
      decoration: underline != null ? TextDecoration.underline : null,
    );
