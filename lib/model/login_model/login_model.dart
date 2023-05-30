class LoginModel {
  int? id;
  String? name;
  String? email;
  String? token;
  static String accessToken="";

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json["user"]["id"];
    name = json["user"]["name"];
    email = json["user"]["email"];
    accessToken = json['token'];
  }
}
