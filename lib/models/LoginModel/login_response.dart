class LoginResponse {
  String? refresh;
  String? access;
 

  LoginResponse({this.refresh, this.access});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
