import 'package:e_commerce_app/data/api/api_clint.dart';
import 'package:e_commerce_app/data/controller/popular_product_controler.dart';
import 'package:e_commerce_app/data/controller/recommended_product_controler.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/repository/reccomended_product_repo.dart';
import 'package:e_commerce_app/utilities/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClinte(appBaseUrl: AppConstats.baseURL));

  Get.lazyPut(() => PopularProductRepo(apiClinte: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClinte: Get.find()));

  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}


// http://mvs.bslmeiyu.com/api/v1/products/popular