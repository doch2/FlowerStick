import 'package:flowerstick/screens/mainSelectStudyTypeMenu.dart';
import 'package:flowerstick/screens/requirePermission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_alert_window/system_alert_window.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _initPermissionState();

    if (!_havePermission) { _openWidget = RequirePermission(); }
  }

  bool _havePermission = true;
  Widget? _openWidget = MainSelectStudyTypeMenu();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) => Scaffold(
          body: GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: child,
          ),
        ),
        home: _openWidget
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> _initPermissionState() async {
    bool havePermission;
    havePermission = (await SystemAlertWindow.checkPermissions)!;

    _havePermission = havePermission;
  }

}