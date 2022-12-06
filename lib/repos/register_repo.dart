import '../core/end_points.dart';
import '../models/RegisterModel/register_model.dart';
import 'base/base_repo.dart';

class RegisterRepo extends BaseRepo {
  Future<RegisterModel?> requestRegister(Map<String,dynamic> data) {
    return networkManager
        .post<RegisterModel>(Endpoints.POST_SIGNUP_API, body: data);
  }
}
