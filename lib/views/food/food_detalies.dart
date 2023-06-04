import 'package:e_commerce_app/helpers/big_text_widget.dart';
import 'package:e_commerce_app/helpers/icon_text.dart';
import 'package:e_commerce_app/helpers/small_text_widget.dart';
import 'package:e_commerce_app/helpers/text_detailes.dart';
import 'package:e_commerce_app/utilities/app_colors.dart';
import 'package:e_commerce_app/utilities/dimentions.dart';
import 'package:flutter/material.dart';

class FoodDetalies extends StatelessWidget {
  const FoodDetalies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: Dimentions.height350,
            child: const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhbHRoeSUyMGZvb2R8ZW58MHx8MHx8&w=1000&q=80'),
            ),
          ),
          Positioned(
            top: Dimentions.height45,
            left: Dimentions.width16,
            right: Dimentions.width16,
            height: Dimentions.height350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  size: Dimentions.height40,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  size: Dimentions.height40,
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              top: Dimentions.height350 - 40,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.height40),
                    topRight: Radius.circular(Dimentions.height40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const BigTextWidget(text: 'Bitter Orange Marinade'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      height: Dimentions.height16,
                    ),
                    BigTextWidget(
                      text: 'Introduce',
                      size: Dimentions.height24,
                    ),
                    SizedBox(
                      height: Dimentions.height8,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: TextDetails(
                          text:
                              'Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled,Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled',
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
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
                borderRadius: BorderRadius.circular(Dimentions.height10 * 2),
              ),
              child: Row(children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
                const BigTextWidget(text: '0'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ]),
            ),
            Container(
              height: Dimentions.height90,
              padding: EdgeInsets.all(Dimentions.height16),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimentions.height10 * 2),
              ),
              child: const Row(children: [
                BigTextWidget(text: "\$10 | Add to card"),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor = const Color(0xff756d54);
  final Color iconBackground = const Color(0xfffcf4a4);
  final double size;
  const AppIcon({
    required this.icon,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: AppColors.textColor),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
      ),
    );
  }
}
