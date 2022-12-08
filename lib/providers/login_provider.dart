import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/models/LoginModel/login_response.dart';
import '../repos/login_repo.dart';
import '../services/local/persistence.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepo? loginRepo = LoginRepo();

  Future<bool> requestLogin(String email, String password) async {
    try {
      //print(loginRepo.requestLogin(email,password));
      LoginResponse? response = await loginRepo?.requestLogin(email, password);
      if (response != null) {
        AppCache.instance.setApiToken(response.access);
        return true;
      }
      notifyListeners();
    } on DioError catch (error) {
      printError(error);
    }
    notifyListeners();
    return false;
  }
}

final loginProvider = ChangeNotifierProvider<LoginProvider>((ref) {
  return LoginProvider();
});
