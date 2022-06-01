import 'dart:convert';

MyUser myUserModelFromJson(String str) => MyUser.fromJson(json.decode(str));

String myUserModelToJson(MyUser data) => json.encode(data.toJson());

class MyUser {
  MyUser({
    this.name,
    this.email,
    this.salary,
    this.mobile,
  });

  String? name;
  String? email;
  int? salary;
  int? mobile;

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        name: json["name"],
        email: json["email"],
        salary: json["salary"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "salary": salary,
        "mobile": mobile,
      };
}
