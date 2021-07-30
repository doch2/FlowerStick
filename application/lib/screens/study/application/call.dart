import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flowerstick/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:flowerstick/screens/studyOverlay.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  _Call createState() => _Call();
}

class _Call extends State<Call> {

  @override
  void initState() {
    super.initState();
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    StudyOverlay studyOverlay = new StudyOverlay(width: _width, height: _height, locTop: (_height * 0.5).round(), description: "표시된 버튼을 눌러\n전화를 할 수 있습니다.");
    studyOverlay.openNewOverlay();
    //openNewOverlay(_width, _height, (_height * 0.2).round(), "배달 창입니다.\n집으로 음식을 배달시키시려면 여기를 누르세요.");
    LaunchApp.openApp(
      androidPackageName: "com.google.android.dialer",
      appStoreLink:
      'itms-apps://https://play.google.com/store/apps/details?id=com.google.android.dialer',
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
      StudyOverlay studyOverlay = new StudyOverlay(width: 1080, height: 1920, locTop: (1920 * 0.5).round(), description: "표시된 키패드를 눌러\n전화를 걸 수 있습니다.");
      studyOverlay.openNewOverlay();
      break;
    default:
      print("OnClick event of $tag");
  }
}