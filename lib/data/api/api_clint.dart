import 'package:e_commerce_app/utilities/app_constants.dart';
import 'package:get/get.dart';

class ApiClinte extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  // ignore: unused_field
  late Map<String, String> _mainHeaders;
  ApiClinte({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstats.token;
    _mainHeaders = {
      "content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
