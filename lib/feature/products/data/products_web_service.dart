import 'package:dio/dio.dart';

class ProductsWebService {
  final Dio dio;

  ProductsWebService({required this.dio});
  Future<Response> getAllProductsResponse() async {
    return await dio.get('https://dummyjson.com/products');
  }
}
