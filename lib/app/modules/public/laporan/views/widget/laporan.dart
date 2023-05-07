import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class LaporanViewJembatan extends StatefulWidget {
  const LaporanViewJembatan({super.key});

  @override
  LaporanViewJembatanState createState() => LaporanViewJembatanState();
}

class LaporanViewJembatanState extends State<LaporanViewJembatan> {
  late InAppWebViewController webViewController;
  String url = "";
  double progress = 0;
  Future<void> disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    disableCapture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Jembatan'),
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
                  url: Uri.parse(
                      "https://sleman.wastuanopama.com/jembatan/jembatan_laporan")),
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

class LaporanViewJalan extends StatelessWidget {
  const LaporanViewJalan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Jalan'),
        centerTitle: true,
      ),
      body: const SizedBox(child: Center(child: Text("Tidak Ada Data"))),
    );
  }
}
