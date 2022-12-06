class RegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? userName;
  String? password;

  RegisterModel({
    this.firstName,
    this.lastName,
    this.email,
    this.userName,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
