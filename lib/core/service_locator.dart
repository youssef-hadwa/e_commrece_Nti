import 'package:dio/dio.dart';
import 'package:e_commerce/core/networking/dio_factory.dart';
import 'package:e_commerce/features/auth/data/auth_repo.dart';
import 'package:e_commerce/features/auth/data/auth_web_service.dart';
import 'package:e_commerce/features/products/data/products_web_service.dart';
import 'package:e_commerce/main.dart';
import 'package:get_it/get_it.dart';

/// global instance
final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<Dio>(DioFactory().dio);
  getIt.registerSingleton(ProductsWebService(dio: getIt<Dio>()));

  getIt.registerSingleton<AuthWebService>(AuthWebService(dio: getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(
      AuthRepo(authWebService: getIt<AuthWebService>()));
}
