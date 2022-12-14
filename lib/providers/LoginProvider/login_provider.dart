import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/models/LoginModel/login_response.dart';
import 'package:kortoba_demo/presentation/components/base/overlays.dart';
import 'package:kortoba_demo/providers/LoginProvider/login_state.dart';
import 'package:kortoba_demo/services/network/network_exceptions.dart';
import '../../repos/login_repo.dart';
import '../../services/local/persistence.dart';

class LoginProvider extends StateNotifier<LoginState> {
  LoginRepo? loginRepo = LoginRepo();

  LoginProvider() : super(LoginInitial()) {
    state = AppCache.instance.getApiToken() != null
        ? UserAuthenticated()
        : UserNonAuthenticated();
  }

  Future<bool> requestLogin(String email, String password) async {
    try {
      state = LoginLoading();

      LoginResponse? response = await loginRepo?.requestLogin(email, password);
      if (response != null) {
        AppCache.instance.setApiToken(response.access);
        state = LoginSucess();
        return true;
      }
    } on DioError catch (error) {
      printError(error);
      state = LoginFailure(message: handleError(error));
      return false;
    }
    return false;
  }
}

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  return LoginProvider();
});
