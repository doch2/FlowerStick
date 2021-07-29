import 'package:flowerstick/painter/bnbCustomPainter.dart';
import 'package:flowerstick/screens/study/application/baemin.dart';
import 'package:flowerstick/screens/study/serviceStudy.dart';
import 'package:flowerstick/themes/color_theme.dart';
import 'package:flowerstick/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class DetailSelectStudyTypeMenu extends StatefulWidget {
  final String windowKind; //windowKind: 앱, 서비스

  const DetailSelectStudyTypeMenu({Key? key, required this.windowKind}) : super(key: key);

  @override
  _DetailSelectStudyTypeMenu createState() => _DetailSelectStudyTypeMenu(windowKind);
}

class _DetailSelectStudyTypeMenu extends State<DetailSelectStudyTypeMenu> {
  final SwiperController swController = SwiperController();

  final String windowKind;
  _DetailSelectStudyTypeMenu(this.windowKind);

  final int applicationLength = 3;


  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    int finalPlusValue = 0;
    if (windowKind == "앱") {
      finalPlusValue = applicationLength;
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                      color: orangeTwo,
                      borderRadius: BorderRadius.circular(30)),
                ),
                Positioned(
                  top: -60,
                  right: -40,
                  child: Image.asset(
                    "assets/images/backgroundCircle.png",
                    height: _height * 0.3,
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _height * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "앱 사용의 길잡이,",
                          style: detailSelectStudyType_subTitle1,
                        ),
                        SizedBox(
                          width: _width * 0.007,
                        ),
                        Text(
                          "지팡이",
                          style: detailSelectStudyType_subTitle2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.02,
                    ),
                    Text(
                      "원하시는 ${windowKind}를 선택해 주세요.",
                      style: detailSelectStudyType_title,
                    ),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    Expanded(
                      child: Swiper(
                        loop: false,
                        index: 0,
                        scrollDirection: Axis.horizontal,
                        controller: swController,
                        viewportFraction: 0.77,
                        scale: 0.8,
                        itemHeight: 100,
                        itemWidth: 100,
                        itemCount: 3,
                        onTap: (index) => Get.to(
                          BaeMin(),
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            SizedBox(
                              height: _height * 0.05,
                            ),
                            Container( //메인 박스
                              height: _height * 0.55,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xF000000),
                                        blurRadius: 99,
                                        offset: Offset(0, 3))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: _height * 0.025,
                                    width: _width,
                                  ),
                                  Container( //사진 박스
                                    width: _width * 0.65,
                                    height: _height * 0.275,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x29000000),
                                              blurRadius: 5,
                                              offset: Offset(2, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Image.asset(
                                      articles[(finalPlusValue + index)]["image"],
                                      height: _height * 0.4,
                                    )
                                  ),
                                  SizedBox(
                                    height: _height * 0.025,
                                  ),
                                  Text(
                                    articles[(finalPlusValue + index)]["title"],
                                    style: detailSelectStudyType_boxTitle,
                                  ),
                                  SizedBox(
                                    height: _height * 0.02,
                                  ),
                                  Text(
                                    articles[(finalPlusValue + index)]["description"],
                                    textAlign: TextAlign.center,
                                    style: detailSelectStudyType_boxDescription,
                                  ),
                                  SizedBox(
                                    height: _height * 0.025,
                                  ),
                                  GestureDetector( //체험하기 버튼
                                    onTap: () => Get.to(articles[(finalPlusValue + index)]["page"]),
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
                                          "체험하기",
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
                    )
                  ],
                ),
              ],
            )
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
                        backgroundColor: Color(0xFFFFCA60),
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

final List<Map> articles = [
  {
    "title": "키오스크 사용하기",
    "description": "키오스크는\n무인단말기입니다.",
    "image": "assets/images/kiosk.png",
    "page": ServiceStudy(studyUrl: "https://doch2.github.io/helloNewWorld_luna2021/web/kiosk_train_1.html")
  },
  {
    "title": "코로나 정보 확인하기",
    "description": "코로나에 대해 알아야\n우리 모두 건강할 수 있습니다.",
    "image": "assets/images/covid.png",
    "page": ServiceStudy(studyUrl: "https://www.google.com/")
  },
  {
    "title": "키오스크 사용하기33",
    "description": "키오스크는\n무인단말기입니다.",
    "image": "assets/images/kiosk.png",
    "page": ServiceStudy(studyUrl: "https://www.google.com/")
  },
  {
    "title": "배달의 민족 사용하기",
    "description": "배달의 민족은 \n집까지 배달해줍니다.",
    "image": "assets/images/baeminLogo.png",
    "page": BaeMin()
  },
  {
    "title": "배달의 민족 사용하기22",
    "description": "배달의 민족은 \n집까지 배달해줍니다.",
    "image": "assets/images/baeminLogo.png",
    "page": BaeMin()
  },
  {
    "title": "배달의 민족 사용하기33",
    "description": "배달의 민족은 \n집까지 배달해줍니다.",
    "image": "assets/images/baeminLogo.png",
    "page": BaeMin()
  },
];