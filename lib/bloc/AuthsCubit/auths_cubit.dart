import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kortoba_demo/repos/register_repo.dart';

import '../../core/debug_prints.dart';
import '../../models/LoginModel/login_response.dart';
import '../../models/RegisterModel/register_response.dart';
import '../../repos/login_repo.dart';
import '../../services/local/persistence.dart';

part 'auths_state.dart';

class AuthsCubit extends Cubit<AuthsState> {
  AuthsCubit() : super(AuthsInitial());

  LoginRepo? loginRepo = LoginRepo();
  RegisterRepo? registerRepo = RegisterRepo();

  Future<bool> requestLogin(String email, String password) async {
    emit(LoginLoadingState());
    try {
      LoginResponse? response = await loginRepo?.requestLogin(email, password);
      if (response != null) {
        emit(LoginSuccessState());
        AppCache.instance.setApiToken(response.access);
        return true;
      }
    } on DioError catch (error) {
      printError(error);
      emit(LoginFailureState(error.message));
    }

    return false;
  }

  Future<bool> requestSignUp(String userName, String password, String email,
      String firstName, String lastName) async {
    try {
      emit(RegisterLoadingState());
      RegisterResponse? response = await registerRepo?.requestRegister(
          userName, password, email, firstName, lastName);
      if (response != null) {
        emit(RegisterSuccessState());
        return true;
      }
    } on DioError catch (error) {
      printError(error);
      emit(RegisterFailureState(error.message));
    }

    return false;
  }

  logOut() {
    emit(LogOutState());
    try {
      AppCache.instance.logout();
    } on Exception catch (e) {
      printError(e);
    }
  }
}
