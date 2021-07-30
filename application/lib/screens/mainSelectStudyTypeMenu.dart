import 'package:flowerstick/controllers/userController.dart';
import 'package:flowerstick/painter/bnbCustomPainter.dart';
import 'package:flowerstick/screens/detailSelectStudyTypeMenu.dart';
import 'package:flowerstick/themes/color_theme.dart';
import 'package:flowerstick/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MainSelectStudyTypeMenu extends GetWidget<UserController> {
  MainSelectStudyTypeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.to(DetailSelectStudyTypeMenu(windowKind: "앱",)),
                  child: Container(
                    height: _height * 0.313,
                    width: _width * 0.85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xF000000),
                            blurRadius: 10,
                          )
                        ],
                        color: orangeOne,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height * 0.02,
                        ),
                        Text(
                          "앱에서 직접 익히기",
                          style: mainSelectStudyType_boxTitle,
                        ),
                        SizedBox(
                          height: _height * 0.02,
                        ),
                        Image.asset(
                          'assets/images/directApp.png',
                          height: _height * 0.21,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 0.06,
                ),
                GestureDetector(
                  onTap: () => Get.to(DetailSelectStudyTypeMenu(windowKind: "서비스",)),
                  child: Container(
                    height: _height * 0.313,
                    width: _width * 0.85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xF000000),
                            blurRadius: 10,
                          )
                        ],
                        color: orangeOne,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height * 0.02,
                        ),
                        Text(
                          "다양한 서비스 살펴보기",
                          style: mainSelectStudyType_boxTitle,
                        ),
                        SizedBox(
                          height: _height * 0.02,
                        ),
                        Image.asset(
                          'assets/images/variousDevice.png',
                          height: _height * 0.2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: _width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(_width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: orangeOne,
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: _height * 0.055,
                        ),
                        elevation: 0.1,
                        onPressed: () {}
                        ),
                  ),
                  Container(
                    width: _width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home_outlined,
                            color: Color(0xFFF2B53A),
                            size: _height * 0.045,
                          ),
                          onPressed: () {},
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color(0xFFF2B53A),
                              size: _height * 0.045,
                            ),
                            onPressed: () {}
                            ),
                        Container(
                          width: _width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.bookmark_border_outlined,
                              color: Color(0xFFF2B53A),
                              size: _height * 0.045,
                            ),
                            onPressed: () {}
                            ),
                        IconButton(
                            icon: Icon(
                              Icons.help_outline_rounded,
                              color: Color(0xFFF2B53A),
                              size: _height * 0.045,
                            ),
                            onPressed: () {}
                            ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    }
}