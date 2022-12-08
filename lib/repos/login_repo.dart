import '../core/end_points.dart';
import '../models/LoginModel/login_response.dart';
import 'base/base_repo.dart';

class LoginRepo extends BaseRepo {
  Future<LoginResponse?> requestLogin(String username, String password) {
    return networkManager.post<LoginResponse>(Endpoints.POST_LOGIN_API,
        body: {"username": username, "password": password});
  }
}
