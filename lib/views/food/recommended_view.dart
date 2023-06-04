import 'package:e_commerce_app/helpers/big_text_widget.dart';
import 'package:e_commerce_app/helpers/text_detailes.dart';
import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:e_commerce_app/views/food/food_detalies.dart';
import 'package:flutter/material.dart';

class RecommendedView extends StatefulWidget {
  const RecommendedView({super.key});

  @override
  State<RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<RecommendedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.height20),
                    topRight: Radius.circular(Dimentions.height20),
                  ),
                ),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BigTextWidget(text: 'Creole Rice Side Dish Recipe'),
                )),
              ),
            ),
            pinned: true,
            expandedHeight: Dimentions.height300,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.close, size: 40),
                AppIcon(icon: Icons.close, size: 40)
              ],
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                width: double.infinity,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80'),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  TextDetails(
                    text:
                        'Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.height40 / 2),
                        color: AppColors.mainColor),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                  const BigTextWidget(text: '\$12.88 *0'),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimentions.height40 / 2),
                        color: AppColors.mainColor),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: Dimentions.height120,
            padding: EdgeInsets.all(
              Dimentions.height10 * 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.height40),
                topRight: Radius.circular(Dimentions.height40),
              ),
              color: AppColors.buttonBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: Dimentions.height90,
                  padding: EdgeInsets.all(Dimentions.height16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimentions.height10 * 2),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                Container(
                  height: Dimentions.height90,
                  padding: EdgeInsets.all(Dimentions.height16),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(Dimentions.height10 * 2),
                  ),
                  child: const Row(children: [
                    BigTextWidget(text: "\$10 | Add to card"),
                  ]),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
