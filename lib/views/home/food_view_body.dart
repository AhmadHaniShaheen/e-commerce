import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/data/controller/popular_product_controler.dart';
import 'package:e_commerce_app/data/controller/recommended_product_controler.dart';
import 'package:e_commerce_app/helpers/big_text_widget.dart';
import 'package:e_commerce_app/helpers/icon_text.dart';
import 'package:e_commerce_app/helpers/small_text_widget.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/utilities/app_constants.dart';
import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/app_colors.dart';

class FoodViewBody extends StatefulWidget {
  const FoodViewBody({super.key});

  @override
  State<FoodViewBody> createState() => _FoodViewBodyState();
}

class _FoodViewBodyState extends State<FoodViewBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;
  var scaleFactor = 0.8;
  double height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<PopularProductController>(
              builder: (
                popualrproduct,
              ) {
                return popualrproduct.isLoaded
                    ? SizedBox(
                        height: Dimentions.height300,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: popualrproduct.popularProducList.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return buildItemBulder(
                                index, popualrproduct.popularProducList[index]);
                          },
                        ),
                      )
                    : SizedBox(
                        height: Dimentions.height300,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ),
                        ),
                      );
              },
            ),
            SizedBox(
              height: Dimentions.height24,
            ),
            GetBuilder<PopularProductController>(
              builder: (controller) {
                return DotsIndicator(
                  dotsCount: controller.popularProducList.isEmpty
                      ? 1
                      : controller.popularProducList.length,
                  position: currentPageValue.toInt(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimentions.height5)),
                  ),
                );
              },
            ),
            SizedBox(
              height: Dimentions.height15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimentions.width16),
              child: Row(
                children: [
                  const BigTextWidget(text: 'Recommended'),
                  SizedBox(
                    width: Dimentions.width10,
                  ),
                  const SmallTextWidget(text: 'Food pairing'),
                ],
              ),
            ),
            GetBuilder<RecommendedProductController>(
              builder: (controller) {
                return controller.isLoaded
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        addAutomaticKeepAlives: true,
                        itemCount: controller.recommendedProducList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimentions.width16,
                                vertical: Dimentions.height10),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimentions.width100,
                                  height: Dimentions.height120,
                                  margin: EdgeInsets.only(
                                      left: Dimentions.width8,
                                      right: Dimentions.width8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Dimentions.height24),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "${AppConstats.baseURL}${AppConstats.uploads}${controller.recommendedProducList[index].img!}",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimentions.width230,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigTextWidget(
                                          text:
                                              "${controller.recommendedProducList[index].name!}"),
                                      SizedBox(
                                        height: Dimentions.height5,
                                      ),
                                      const SmallTextWidget(
                                          text: 'with Palstinen carctarestic'),
                                      SizedBox(
                                        height: Dimentions.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const IconTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          SizedBox(
                                            width: Dimentions.width5,
                                          ),
                                          const IconTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.mainColor,
                                          ),
                                          SizedBox(
                                            width: Dimentions.width5,
                                          ),
                                          const IconTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '32min',
                                            iconColor: AppColors.iconColor2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  Transform buildItemBulder(int index, ProductModel popualrproduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentPageValue.floor()) {
      var currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currentTranc = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranc, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      var currentTranc = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranc, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currentTranc = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranc, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, height * (1 - currentScale) / 2, 1);
    }
    // final imge = ProductModel().img!;
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.height220,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: index.isOdd ? Colors.red : Colors.blue,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${AppConstats.baseURL}${AppConstats.uploads}${popualrproduct.img!}",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.height120,
              margin: EdgeInsets.only(
                bottom: Dimentions.height10,
                left: Dimentions.height20,
                right: Dimentions.height20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.all(Dimentions.width8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigTextWidget(text: popualrproduct.name!),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 18,
                                    )),
                          ),
                          SizedBox(
                            width: Dimentions.width10,
                          ),
                          const SmallTextWidget(text: '4.5'),
                          SizedBox(
                            width: Dimentions.width10,
                          ),
                          const SmallTextWidget(text: '1287'),
                          SizedBox(
                            width: Dimentions.width5,
                          ),
                          const SmallTextWidget(text: 'comments'),
                        ],
                      ),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const IconTextWidget(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1,
                          ),
                          SizedBox(
                            width: Dimentions.width5,
                          ),
                          const IconTextWidget(
                            icon: Icons.location_on,
                            text: '1.7km',
                            iconColor: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: Dimentions.width5,
                          ),
                          const IconTextWidget(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: AppColors.iconColor2,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
