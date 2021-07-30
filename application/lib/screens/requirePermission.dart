import 'package:flowerstick/screens/mainSelectStudyTypeMenu.dart';
import 'package:flowerstick/themes/color_theme.dart';
import 'package:flowerstick/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:get/get.dart';

class RequirePermission extends StatefulWidget {
  const RequirePermission({Key? key}) : super(key: key);

  @override
  _RequirePermission createState() => _RequirePermission();
}

class _RequirePermission extends State<RequirePermission> {

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
          height: _height * 0.65,
          width: _width * 0.8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xF000000),
                  blurRadius: 10,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.02,
              ),
              Text(
                "앱 권한 필요",
                style: permission_boxTitle,
              ),
              SizedBox(
                height: _height * 0.05,
              ),
              Text(
                "다른 앱 위에 그리기",
                style: permission_boxSubTitle,
              ),
              SizedBox(
                height: _height * 0.015,
              ),
              Text(
                "원할한 교육 진행을 위해 \n권한이 필요하니 다음 설정에서 \n허용하기를 눌러 권한을 설정해주세요.",
                style: permission_boxDescription,
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              Image.asset(
                'assets/images/permissionSetting.png',
                height: _height * 0.27,
              ),
              SizedBox(
                height: _height * 0.025,
              ),
              GestureDetector(
                onTap: getPermission,
                child: Container(
                  width: _width * 0.67,
                  height: _height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: orangeOne,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "권한 설정하러 가기",
                      style: detailSelectStudyType_boxButton,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }

  void getPermission() {
    SystemAlertWindow.requestPermissions;
    Get.to(MainSelectStudyTypeMenu());
  }

}