import 'package:flutter/material.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'package:flowerstick/screens/studyOverlay.dart';

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

    StudyOverlay studyOverlay = new StudyOverlay();
    studyOverlay.openNewOverlay();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("asdfsadf"),
          ],
        ),
      ),
    );
  }

}