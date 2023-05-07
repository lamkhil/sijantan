import 'package:flutter/material.dart';

import '../../../../../global/utils/constants/asset_const.dart';
import '../../../../../global/utils/helper.dart';

class KegiatanDetail extends StatelessWidget {
  const KegiatanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: height(200)),
          child: Container(
            height: height(425),
            width: width(327),
            decoration: boxDecoration(
              shadow: true,
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height(138),
                  width: width(295),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          AssetHome.slider,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Jembatan",
                            style: textStyle(width(10),
                                color: const Color.fromARGB(255, 153, 150, 150),
                                weight: FontWeight.w500),
                          ),
                          SizedBox(height: height(3)),
                          Text(
                            "Jembatan Gantung",
                            style: textStyle(width(12),
                                color: Colors.black, weight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        width: width(73),
                      ),
                      Column(
                        children: [
                          Text(
                            "Tahun",
                            style: textStyle(width(10),
                                color: const Color.fromARGB(255, 153, 150, 150),
                                weight: FontWeight.w500),
                          ),
                          SizedBox(height: height(3)),
                          Text(
                            "2022",
                            style: textStyle(width(12),
                                color: Colors.black, weight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height(16)),
                Padding(
                  padding: EdgeInsets.only(left: width(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pekerjaan",
                            style: textStyle(width(10),
                                color: const Color.fromARGB(255, 153, 150, 150),
                                weight: FontWeight.w500),
                          ),
                          SizedBox(height: height(3)),
                          Wrap(children: [
                            SizedBox(
                              width: width(295),
                              child: Text(
                                "Membangun Infrastruktur  Dan Memperbaiki Jembatan yang Rusak Farah",
                                softWrap: true,
                                style: textStyle(width(12),
                                    color: Colors.black,
                                    weight: FontWeight.w500),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height(16)),
                Padding(
                  padding: EdgeInsets.only(left: width(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diskripsi",
                            style: textStyle(width(10),
                                color: const Color.fromARGB(255, 153, 150, 150),
                                weight: FontWeight.w500),
                          ),
                          SizedBox(height: height(3)),
                          Wrap(children: [
                            SizedBox(
                              width: width(295),
                              child: Text(
                                "Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                                softWrap: true,
                                style: textStyle(width(12),
                                    color: const Color(0XFF1D3A70),
                                    weight: FontWeight.w500),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
