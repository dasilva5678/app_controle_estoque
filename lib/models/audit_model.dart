// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuditModel {
  final String? id;
  final String? userID;
  final String? statusID;
  final String? unit;
  final String? date;
  AuditModel({
    this.id,
    this.userID,
    this.statusID,
    this.unit,
    this.date,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id ?? "",
      'userID': userID ?? "",
      'statusID': statusID ?? "",
      'unitStore': unit ?? "",
      'date': date ?? "",
    };
  }

  factory AuditModel.fromMap(Map<dynamic, dynamic> map) {
    return AuditModel(
      id: map['id'] != null ? map['id'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      statusID: map['statusID'] != null ? map['statusID'] as String : null,
      unit: map['unitStore'] != null ? map['unitStore'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuditModel.fromJson(String source) =>
      AuditModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
