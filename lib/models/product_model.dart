import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? id;
  String? nameProduct;
  String? quantityPerPack;
  String? amount;
  String? barCode;
  String? auditId;
  String? userID;
  String? expirationDate;
  ProductModel({
    this.id,
    this.nameProduct,
    this.quantityPerPack,
    this.amount,
    this.barCode,
    this.auditId,
    this.userID,
    this.expirationDate,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id ?? '',
      'nameProduct': nameProduct ?? '',
      'quantityPerPack': quantityPerPack ?? '',
      'amount': amount ?? '',
      'barCode': barCode ?? '',
      'auditId': auditId ?? '',
      'userID': userID ?? '',
      'expirationDate': expirationDate ?? '',
    };
  }

  factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      nameProduct:
          map['nameProduct'] != null ? map['nameProduct'] as String : null,
      quantityPerPack: map['quantityPerPack'] != null
          ? map['quantityPerPack'] as String
          : null,
      amount: map['amount'] != null ? map['amount'] as String : null,
      barCode: map['barCode'] != null ? map['barCode'] as String : null,
      auditId: map['auditId'] != null ? map['auditId'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      expirationDate: map['expirationDate'] != null
          ? map['expirationDate'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
