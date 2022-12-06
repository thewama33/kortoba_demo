import '../core/end_points.dart';
import '../models/LoginModel/login_model.dart';
import 'base/base_repo.dart';

class LoginRepo extends BaseRepo {
  Future<LoginModel?> requestLogin(Map<String, dynamic> data) {
    return networkManager.post<LoginModel>(Endpoints.POST_LOGIN_API,
        body: data);
  }
}
