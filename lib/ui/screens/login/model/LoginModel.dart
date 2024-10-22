
class LoginModel {
  late final token;

  LoginModel({this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    return data;
  }
}
