// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeBase, Store {
  late final _$userCacheAtom =
      Atom(name: 'HomeBase.userCache', context: context);

  @override
  UserModel get userCache {
    _$userCacheAtom.reportRead();
    return super.userCache;
  }

  @override
  set userCache(UserModel value) {
    _$userCacheAtom.reportWrite(value, super.userCache, () {
      super.userCache = value;
    });
  }

  late final _$auditModelAtom =
      Atom(name: 'HomeBase.auditModel', context: context);

  @override
  AuditModel get auditModel {
    _$auditModelAtom.reportRead();
    return super.auditModel;
  }

  @override
  set auditModel(AuditModel value) {
    _$auditModelAtom.reportWrite(value, super.auditModel, () {
      super.auditModel = value;
    });
  }

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

  late final _$pendingListAtom =
      Atom(name: 'HomeBase.pendingList', context: context);

  @override
  List<AuditModel> get pendingList {
    _$pendingListAtom.reportRead();
    return super.pendingList;
  }

  @override
  set pendingList(List<AuditModel> value) {
    _$pendingListAtom.reportWrite(value, super.pendingList, () {
      super.pendingList = value;
    });
  }

  late final _$sentListAtom = Atom(name: 'HomeBase.sentList', context: context);

  @override
  List<AuditModel> get sentList {
    _$sentListAtom.reportRead();
    return super.sentList;
  }

  @override
  set sentList(List<AuditModel> value) {
    _$sentListAtom.reportWrite(value, super.sentList, () {
      super.sentList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getLocalUserAsyncAction =
      AsyncAction('HomeBase.getLocalUser', context: context);

  @override
  Future<void> getLocalUser() {
    return _$getLocalUserAsyncAction.run(() => super.getLocalUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('HomeBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$createAuditAsyncAction =
      AsyncAction('HomeBase.createAudit', context: context);

  @override
  Future<void> createAudit(
      {required String? userID,
      required String? status,
      required String? unit,
      required String? date,
      required BuildContext context}) {
    return _$createAuditAsyncAction.run(() => super.createAudit(
        userID: userID,
        status: status,
        unit: unit,
        date: date,
        context: context));
  }

  late final _$getAuditAsyncAction =
      AsyncAction('HomeBase.getAudit', context: context);

  @override
  Future<void> getAudit(String auditId, BuildContext context) {
    return _$getAuditAsyncAction.run(() => super.getAudit(auditId, context));
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSendList(List<AuditModel> value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setSendList');
    try {
      return super.setSendList(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPendingList(List<AuditModel> value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setPendingList');
    try {
      return super.setPendingList(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

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
userCache: ${userCache},
auditModel: ${auditModel},
auditList: ${auditList},
productList: ${productList},
pendingList: ${pendingList},
sentList: ${sentList},
isLoading: ${isLoading}
    ''';
  }
}
