class LoginModel {

  String? username;
  String? password;

  LoginModel({this.username, this.password});

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}