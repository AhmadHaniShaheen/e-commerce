import 'package:e_commerce_app/data/controller/popular_product_controler.dart';
import 'package:e_commerce_app/data/controller/recommended_product_controler.dart';
import 'package:e_commerce_app/views/home/main_food_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/utilities/dependence.dart' as dependence;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependence.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainFoodView(title: 'Food'),
    );
  }
}
