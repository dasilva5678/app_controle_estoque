// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? '',
      'name': name ?? '',
      'phone': phone ?? '',
      'email': email ?? '',
      'password': password ?? '',
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as dynamic);
}
