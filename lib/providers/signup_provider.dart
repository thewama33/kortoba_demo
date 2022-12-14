import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortoba_demo/models/RegisterModel/register_response.dart';
import 'package:kortoba_demo/repos/register_repo.dart';
import 'package:kortoba_demo/services/network/network_exceptions.dart';

import '../core/debug_prints.dart';

class SignUpProvider extends ChangeNotifier {
  RegisterRepo? registerRepo = RegisterRepo();

  Future<bool> requestSigUp(String userName, String password, String email,
      String firstName, String lastName) async {
    try {
      //print(loginRepo.requestLogin(email,password));
      RegisterResponse? response = await registerRepo?.requestRegister(
          userName, password, email, firstName, lastName);
      if (response != null) {
        return true;
      }
      notifyListeners();
    } on DioError catch (error) {
      printError(handleError(error));
    }
    notifyListeners();
    return false;
  }
}

final registerProvider = ChangeNotifierProvider<SignUpProvider>((ref) {
  return SignUpProvider();
});
