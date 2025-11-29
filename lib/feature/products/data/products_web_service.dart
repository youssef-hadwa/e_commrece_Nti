import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ProductsWebService {
  final Dio dio;

  ProductsWebService({required this.dio});

  Future<Response> getAllProductsResponse() async {
    return await dio.get('https://dummyjson.com/products');
  }
}
