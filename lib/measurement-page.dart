import 'package:flutter/material.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Measurement3D extends StatefulWidget {
  @override
  _Measurement3DState createState() => _Measurement3DState();
}

class _Measurement3DState extends State<Measurement3D> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      endDrawer: const Baricon(),
      appBar: AppBar(
        title: Text(
          'Coach Bot',
          style: SafeGoogleFont(
            'Zen Dots',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2999999523 * ffem / fem,
            letterSpacing: -0.16 * fem,
            color: const Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            //Navigator.pushReplacementNamed(context, "homepage");
          },
          child: Padding(
            padding: EdgeInsets.all(12 * fem),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: WebView(
        initialUrl: 'https://bodyvisualizer.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          this.controller = webViewController;
        },
      ),
    );
  }
}
