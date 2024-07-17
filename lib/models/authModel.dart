import 'dart:convert';

class UserApiModel {
  late UserModel auth;

  UserApiModel({required this.auth});

  UserApiModel.fromJson(Map<String, dynamic> json) {
    if (json['values'] != null) {
      auth = UserModel.fromJson(json['values']);
    }
  }
}

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  String? sId;
  String? token;

  UserModel({this.sId, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.sId;
    data['token'] = this.token;
    return data;
  }
}
