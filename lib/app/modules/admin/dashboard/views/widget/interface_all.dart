import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../../../../global/utils/helper.dart';
import '../../../../../global/utils/pallete.dart';

class InterfaceAll extends StatelessWidget {
  const InterfaceAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.toDark.shade50,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(30)),
        child: Container(
            height: height(300),
            width: width(348),
            decoration: boxDecoration(color: Colors.white, radius: 5),
            child: Chart(
              data: const [
                {'genre': 'Aspal', 'sold': 0},
                {'genre': 'Beton', 'sold': 9.45},
                {'genre': 'Krikil', 'sold': 17.5},
                {'genre': 'Tanah', 'sold': 0.4},
              ],
              variables: {
                'genre': Variable(
                  accessor: (Map map) => map['genre'] as String,
                ),
                'sold': Variable(
                  accessor: (Map map) => map['sold'] as num,
                ),
              },
              elements: [
                IntervalElement(
                  shape: ShapeAttr(
                      value: RectShape(borderRadius: BorderRadius.circular(6))),
                  size: SizeAttr(value: 60),
                  color: ColorAttr(
                    variable: 'sold',
                    values: const [
                      Color.fromARGB(255, 243, 186, 28),
                      Color.fromARGB(255, 35, 19, 182),
                      Color(0xFF00D8A4),
                      Color(0xFF00A4D8)
                    ],
                  ),
                ),
              ],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
            )),
      ),
    );
  }
}
