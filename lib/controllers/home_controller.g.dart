// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeBase, Store {
  late final _$auditListAtom =
      Atom(name: 'HomeBase.auditList', context: context);

  @override
  List<AuditModel> get auditList {
    _$auditListAtom.reportRead();
    return super.auditList;
  }

  @override
  set auditList(List<AuditModel> value) {
    _$auditListAtom.reportWrite(value, super.auditList, () {
      super.auditList = value;
    });
  }

  late final _$productListAtom =
      Atom(name: 'HomeBase.productList', context: context);

  @override
  List<AuditModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<AuditModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  Color getColor(String status) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.getColor');
    try {
      return super.getColor(status);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
auditList: ${auditList},
productList: ${productList}
    ''';
  }
}
