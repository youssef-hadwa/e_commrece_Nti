import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/networking/api_error_handler.dart';
import 'package:e_commerce/features/auth/data/auth_repo.dart';
import 'package:e_commerce/features/auth/data/models/login_request_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());
    try {
      await authRepo.login(loginRequestModel);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: ApiErrorHandler.handle(e)));
    }
  }
}
