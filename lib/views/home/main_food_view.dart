import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:e_commerce_app/views/home/food_view_body.dart';
import 'package:flutter/material.dart';

import '../../helpers/big_text_widget.dart';
import '../../helpers/small_text_widget.dart';
import '../../utilities/app_colors.dart';

class MainFoodView extends StatefulWidget {
  const MainFoodView({super.key, required this.title});
  final String title;

  @override
  State<MainFoodView> createState() => _MainFoodViewState();
}

class _MainFoodViewState extends State<MainFoodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: Dimentions.height45, bottom: Dimentions.height15),
            padding: EdgeInsets.symmetric(horizontal: Dimentions.width16),
            width: double.infinity,
            height: Dimentions.height55,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigTextWidget(
                        text: widget.title,
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          const SmallTextWidget(
                            text: 'Gaza',
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: Dimentions.width10,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimentions.height45,
                    height: Dimentions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.height15),
                        color: AppColors.mainColor),
                    child: const Icon(Icons.search),
                  ),
                ]),
          ),
          const FoodViewBody(),
        ],
      ),
    );
  }
}
