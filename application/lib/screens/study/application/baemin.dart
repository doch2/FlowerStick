import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flowerstick/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:flowerstick/screens/studyOverlay.dart';

class BaeMin extends StatefulWidget {
  const BaeMin({Key? key}) : super(key: key);

  @override
  _BaeMin createState() => _BaeMin();
}

class _BaeMin extends State<BaeMin> {

  @override
  void initState() {
    super.initState();
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    StudyOverlay studyOverlay = new StudyOverlay(width: _width, height: _height, locTop: (_height * 0.5).round(), description: "배달 창입니다.\n집으로 음식을 배달시키시려면 여기를 누르세요.");
    studyOverlay.openNewOverlay();
    //openNewOverlay(_width, _height, (_height * 0.2).round(), "배달 창입니다.\n집으로 음식을 배달시키시려면 여기를 누르세요.");
    LaunchApp.openApp(
      androidPackageName: "com.sampleapp",
      appStoreLink:
      'itms-apps://https://play.google.com/store/apps/details?id=com.sampleapp',
    );


    return Scaffold();
  }

}

///
/// Whenever a button is clicked, this method will be invoked with a tag (As tag is unique for every button, it helps in identifying the button).
/// You can check for the tag value and perform the relevant action for the button click
///
void callBack(String tag) {
  print(tag);
  switch (tag) {
    case "next_button":
      StudyOverlay studyOverlay = new StudyOverlay(width: 1080, height: 1920, locTop: (1920 * 0.5).round(), description: "표시된 메뉴를 눌러\n주문할 수 있습니다.");
      studyOverlay.openNewOverlay();
      break;
  }
}