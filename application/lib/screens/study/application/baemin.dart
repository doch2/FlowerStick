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
  static const MethodChannel _channel = const MethodChannel('com.luna.flowerstick.methodchannel');

  Future<void> openBaeMinApp() async {
    await _channel.invokeMethod('openBaeMinApp');
  }

  @override
  void initState() {
    super.initState();
    SystemAlertWindow.registerOnClickListener(callBack);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    //StudyOverlay studyOverlay = new StudyOverlay(width: _width, height: _height, locTop: (_height * 0.2).round());
    //studyOverlay.openNewOverlay();
    openNewOverlay(_width, _height, (_height * 0.2).round());


    return Scaffold();
  }

  void openNewOverlay(double width, double height, int locTop) {
    SystemWindowHeader header = SystemWindowHeader(
        title: SystemWindowText(text: " ", fontSize: 5, textColor: Colors.black45),
        padding: SystemWindowPadding.setSymmetricPadding(1, 1),
        //subTitle: SystemWindowText(text: "9898989899", fontSize: 14, fontWeight: FontWeight.BOLD, textColor: Colors.black87),
        decoration: SystemWindowDecoration(startColor: overlayColor), //Colors.grey[100]
        //button: SystemWindowButton(text: SystemWindowText(text: "Personal", fontSize: 10, textColor: Colors.black45), tag: "personal_btn"),
        buttonPosition: ButtonPosition.TRAILING
    );
    SystemWindowBody body = SystemWindowBody(
      decoration: SystemWindowDecoration(startColor: overlayColor),
      rows: [
        EachRow(
          columns: [
            EachColumn(
              text: SystemWindowText(text: "안녕하세요 반갑습니다.", fontSize: 20, textColor: Colors.black, fontWeight: FontWeight.BOLD),
            ),
          ],
          gravity: ContentGravity.CENTER,
        ),
        EachRow(
          columns: [
            EachColumn(
              text: SystemWindowText(text: " ", fontSize: 10, textColor: Colors.black54, fontWeight: FontWeight.BOLD),
            ),
          ],
          gravity: ContentGravity.LEFT,
        ),
      ],
      padding: SystemWindowPadding(left: 16, right: 16, bottom: 12, top: 12),
    );
    SystemWindowFooter footer = SystemWindowFooter(
        buttons: [
          SystemWindowButton(
            text: SystemWindowText(text: "다음으로", fontSize: 18, textColor: Colors.white, fontWeight: FontWeight.BOLD),
            tag: "next_button",
            width: 0,
            padding: SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
            height: SystemWindowButton.WRAP_CONTENT,
            decoration: SystemWindowDecoration(
                startColor: Color.fromRGBO(250, 139, 97, 1), endColor: Color.fromRGBO(247, 28, 88, 1), borderWidth: 0, borderRadius: 30.0),
          )
        ],
        padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
        decoration: SystemWindowDecoration(startColor: overlayColor),
        buttonsPosition: ButtonPosition.CENTER);
    SystemAlertWindow.showSystemWindow(
        height: (height * 0.19).round(),
        width: (width * 0.8).round(),
        header: header,
        body: body,
        footer: footer,
        margin: SystemWindowMargin(left: 8, right: 8, top: locTop, bottom: 0),
        gravity: SystemWindowGravity.TOP,
        notificationTitle: "Incoming Call",
        notificationBody: "+1 646 980 4741",
        prefMode: SystemWindowPrefMode.BUBBLE
    );
  }

}

///
/// Whenever a button is clicked, this method will be invoked with a tag (As tag is unique for every button, it helps in identifying the button).
/// You can check for the tag value and perform the relevant action for the button click
///
void callBack(String tag) {
  print(tag);
  switch (tag) {
    case "simple_button":
    case "updated_simple_button":
      SystemAlertWindow.closeSystemWindow();
      break;
    case "next_button":
      print("Focus button has been called");
      break;
    default:
      print("OnClick event of $tag");
  }
}