//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../utils/helper.dart';

class DialogIzin {
  DialogIzin._();

  static Future<dynamic> izinDialog() async {
    return Get.dialog(
      Center(
        child: SizedBox(
          height: height(311),
          width: width(330),
          child: Card(
            child: Column(
              children: [
                SizedBox(height: height(13)),
                Text(
                  "Informasi",
                  textAlign: TextAlign.center,
                  style: textStyle(20,
                      weight: FontWeight.w600, color: const Color(0XFF0F77BF)),
                ),
                const SizedBox(height: 27),
                Text(
                  "Izin Pemanfaatan Ruang Milik Jalan Untuk :",
                  style: textStyle(15, weight: FontWeight.w600),
                ),
                const SizedBox(height: 27),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(16)),
                  child: Text(
                    "1. Akses jalan masuk/penutupan saluran Drainase\n2. Utilitas (Pemasangan Tiang Kabel FO,Listrik, Pipa Air Minum dan Air limbah)\n3. Media Iklan/ Reklame",
                    style: textStyle(13, weight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height(36)),
                SizedBox(
                  height: height(44),
                  width: width(229),
                  child: ElevatedButton(
                      style: buttonStyle(color: Colors.blue),
                      onPressed: () => Get.to(() =>
                          const WebView()), //launchUrl(Uri.parse("https://perizinan.slemankab.go.id/"), mode: LaunchMode.inAppWebView),
                      child: Text(
                        "Tekan Untuk Akses Perizinan",
                        style: textStyle(14,
                            weight: FontWeight.w700, color: Colors.white),
                      )),
                ),
                // InAppWebView(initialUrlRequest: URLRequest(url: Uri.parse("https://flutter.dev/")), initialOptions: InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  late InAppWebViewController webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perizinan'),
        centerTitle: true,
      ),
      body: SizedBox(
          child: Column(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10.0),
            child: progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container()),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: InAppWebView(
              onReceivedServerTrustAuthRequest: (controller, challenge) async {
                return ServerTrustAuthResponse(
                    action: ServerTrustAuthResponseAction.PROCEED);
              },
              initialUrlRequest: URLRequest(
                  url: Uri.parse("https://perizinan.slemankab.go.id/")),
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions()),
              onWebViewCreated: (InAppWebViewController controller) {
                webViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ),
      ])),
    );
  }
}
