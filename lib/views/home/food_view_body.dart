import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/helpers/big_text_widget.dart';
import 'package:e_commerce_app/helpers/icon_text.dart';
import 'package:e_commerce_app/helpers/small_text_widget.dart';
import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              Matrix4 matrix = Matrix4.identity();
              if (index == currentPageValue.floor()) {
                var currentScale =
                    1 - (currentPageValue - index) * (1 - scaleFactor);
                var currentTranc = height * (1 - currentScale) / 2;
                matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                  ..setTranslationRaw(0, currentTranc, 0);
              } else if (index == currentPageValue.floor() + 1) {
                var currentScale = scaleFactor +
                    (currentPageValue - index + 1) * (1 - scaleFactor);
                var currentTranc = height * (1 - currentScale) / 2;
                matrix = Matrix4.diagonal3Values(1, currentScale, 1);
                matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                  ..setTranslationRaw(0, currentTranc, 0);
              } else if (index == currentPageValue.floor() - 1) {
                var currentScale =
                    1 - (currentPageValue - index) * (1 - scaleFactor);
                var currentTranc = height * (1 - currentScale) / 2;
                matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                  ..setTranslationRaw(0, currentTranc, 0);
              } else {
                var currentScale = 0.8;
                matrix = Matrix4.diagonal3Values(1, currentScale, 1)
                  ..setTranslationRaw(0, height * (1 - currentScale) / 2, 1);
              }
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Dimentions.height120,
                        margin: EdgeInsets.only(
                          bottom: Dimentions.height10,
                          left: Dimentions.hieght20,
                          right: Dimentions.hieght20,
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
                                const BigTextWidget(
                                    text: 'Bitter Orange Marinade'),
                                const SizedBox(
                                  height: 10,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SmallTextWidget(text: '4.5'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const SmallTextWidget(text: '1287'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const SmallTextWidget(text: 'comments'),
                                  ],
                                ),
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
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: Dimentions.hieght24,
        ),
        DotsIndicator(
          dotsCount: 5,
          position: currentPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimentions.height5)),
          ),
        ),
      ],
    );
  }
}
