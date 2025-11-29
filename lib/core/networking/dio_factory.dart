import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio;

  get dio => _dio;
  DioFactory() : _dio = Dio() {
// customization
    _dio.interceptors.add(PrettyDioLogger(
      // requestHeader: true,
      // requestBody: false,
      // responseBody: false,
      // responseHeader: false,
      error: true,
      // compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
      // filter: (options, args) {
      //   // don't print requests with uris containing '/posts'
      //   if (options.path.contains('/posts')) {
      //     return false;
      //   }
      //   // don't print responses with unit8 list data
      //   return !args.isResponse || !args.hasUint8ListData;
      // },
    ));
  }

  //  create dio object from custom constructor to use pretty dio logger or any customization
}
