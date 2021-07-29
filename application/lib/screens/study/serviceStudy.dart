import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:flowerstick/screens/studyOverlay.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceStudy extends StatefulWidget {
  final String studyUrl;

  const ServiceStudy({Key? key, required this.studyUrl}) : super(key: key);

  @override
  _ServiceStudy createState() => _ServiceStudy(studyUrl);
}

class _ServiceStudy extends State<ServiceStudy> {

  final String studyUrl;
  _ServiceStudy(this.studyUrl);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    StudyOverlay studyOverlay = new StudyOverlay();
    studyOverlay.openNewOverlay();

    return WebView(
      initialUrl: studyUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}