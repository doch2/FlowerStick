import 'package:flowerstick/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';

class StudyOverlay {
  final double width, height;
  final int locTop;

  const StudyOverlay({Key? key, required this.width, required this.height, required this.locTop});

  void openNewOverlay() {
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