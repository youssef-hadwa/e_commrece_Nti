import 'package:dio/dio.dart';
import 'package:e_commerce/features/auth/data/models/login_request_model.dart';

class AuthWebService {
  final Dio dio;

  AuthWebService({required this.dio});

  Future<Response> login(LoginRequestModel loginRequestModel) async {
    return await dio.post('https://accessories-eshop.runasp.net/api/auth/login',
        data: loginRequestModel.toJson());
  }
}
