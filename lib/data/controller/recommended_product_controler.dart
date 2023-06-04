// ignore_for_file: avoid_print

import 'package:e_commerce_app/data/repository/reccomended_product_repo.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  bool isLoaded = false;

  RecommendedProductController({required this.recommendedProductRepo});
  // ignore: prefer_final_fields
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProducList => _recommendedProductList;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    print('response is $response ');

    print('responce is $response');
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      update();
      isLoaded = true;
    } else {
      print('here is $_recommendedProductList');
    }
  }
}
