import 'package:kortoba_demo/models/RegisterModel/register_response.dart';

import '../core/end_points.dart';
import 'base/base_repo.dart';

class RegisterRepo extends BaseRepo {
  Future<RegisterResponse?> requestRegister(Map<String,dynamic> data) {
    return networkManager
        .post<RegisterResponse>(Endpoints.POST_SIGNUP_API, body: data);
  }
}
