import 'package:kortoba_demo/models/RegisterModel/register_response.dart';

import '../core/end_points.dart';
import 'base/base_repo.dart';

class RegisterRepo extends BaseRepo {
  Future<RegisterResponse?> requestRegister(String userName, String password,
      String email, String firstName, String lastName) {
    return networkManager
        .post<RegisterResponse>(Endpoints.POST_SIGNUP_API, body: {
      "username": userName,
      "password": password,
      "email": email,
      "first_name": firstName,
      "last_name": lastName
    });
  }
}
