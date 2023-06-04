import 'package:e_commerce_app/data/api/api_clint.dart';
import 'package:e_commerce_app/utilities/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClinte apiClinte;
  PopularProductRepo({required this.apiClinte});

  Future<Response> getPopularProductList() async {
    return await apiClinte.getData(AppConstats.popualrProductUri);
  }
}


// http://mvs.bslmeiyu.com/api/v1/products/popular