import 'package:e_commerce/features/auth/data/auth_web_service.dart';
import 'package:e_commerce/features/auth/data/models/login_request_model.dart';
import 'package:e_commerce/features/auth/data/models/login_response_model.dart';

class AuthRepo {
  final AuthWebService authWebService;

  AuthRepo({required this.authWebService});

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await authWebService.login(loginRequestModel);
    return LoginResponseModel.fromJson(response.data);
  }
}
