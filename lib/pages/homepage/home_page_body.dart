import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/sector_controller.dart';
import 'package:swastik_air_hub/model/sector.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/expandable_text.dart';

import '../../utils/Color/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("currenPageValue" + _currentPageValue.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("current screen height" +
        MediaQuery.of(context).size.height.toString());
    print("width" + MediaQuery.of(context).size.width.toString());
    Get.find<SectorController>().getPopularProductList();

    return ListView(physics: AlwaysScrollableScrollPhysics(), children: [
      Container(
        child: Column(
          children: [
            GetBuilder<SectorController>(builder: (sectors) {
              return GestureDetector(
                child: Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: sectors.sectorList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(index, sectors.sectorList[index]);
                      }),
                ),
              );
            }),
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.width30,
              ),
              child: Row(
                children: [BigText(text: "Popular Destinations")],
              ),
            ),
            //list of food and images
            GetBuilder<SectorController>(builder: (sectors) {
              return Container(
                height: Dimensions.height10 * 70,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sectors.sectorList.isEmpty
                      ? 0
                      : sectors.sectorList.length - 5,
                  itemBuilder: (context, index) {
                    return _buildRecommendedItemPage(
                        index, sectors.sectorList[index]);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    ]);
  }

  Widget _buildPageItem(index, Sector sector) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var _currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      var matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var _currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, _currScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var _currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    } else {
      var _currScale = 0.8;
      var _currTrans = _height * (1 - _currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1);

      matrix = Matrix4.diagonal3Values(1, _currScale, 1)
        ..setTranslationRaw(0, _currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewTextContainer,
            width: Dimensions.width10 * 200,
            margin: EdgeInsets.only(
                top: Dimensions.height40,
                left: Dimensions.height10,
                right: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 87, 76, 148),
            ),
            child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: Center(
                  child: BigText(
                    text: sector.from!,
                    size: 30,
                    color: Colors.white,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              width: Dimensions.width10 * 200,
              margin: EdgeInsets.only(
                  left: Dimensions.height10,
                  right: Dimensions.height10,
                  bottom: Dimensions.height40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 158, 71, 65),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.height15,
                      right: Dimensions.height15),
                  child: Center(
                    child: BigText(
                      text: sector.to!,
                      size: 30,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedItemPage(int index, Sector sector) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          //imageContainer
          Container(
            width: Dimensions.height10 * 12,
            height: Dimensions.height10 * 12,
            margin: EdgeInsets.only(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white38,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/pokhara.png"),
              ),
            ),
          ),
          //textContainer
          Expanded(
            child: Container(
              width: Dimensions.height10 * 23,
              height: Dimensions.height10 * 12,
              margin: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: sector.to!),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Lorem Ipsum is simplyhhyg',
                            size: 15,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
