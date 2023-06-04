import 'package:e_commerce_app/data/api/api_clint.dart';
import 'package:e_commerce_app/utilities/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClinte apiClinte;
  RecommendedProductRepo({required this.apiClinte});

  Future<Response> getRecommendedProductList() async {
    return await apiClinte.getData(AppConstats.recommendedProductUri);
  }
}


// http://mvs.bslmeiyu.com/api/v1/products/recommended