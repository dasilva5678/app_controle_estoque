// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginBase, Store {
  late final _$userAtom = Atom(name: 'LoginBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$emailAtom = Atom(name: 'LoginBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginBase.isLoading', context: context);

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

  late final _$isObscureAtom =
      Atom(name: 'LoginBase.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$isCheckLoginStateAtom =
      Atom(name: 'LoginBase.isCheckLoginState', context: context);

  @override
  bool get isCheckLoginState {
    _$isCheckLoginStateAtom.reportRead();
    return super.isCheckLoginState;
  }

  @override
  set isCheckLoginState(bool value) {
    _$isCheckLoginStateAtom.reportWrite(value, super.isCheckLoginState, () {
      super.isCheckLoginState = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginBase.login', context: context);

  @override
  Future<UserModel> login(
      {required String email,
      required String password,
      required BuildContext context}) {
    return _$loginAsyncAction.run(
        () => super.login(email: email, password: password, context: context));
  }

  late final _$checkStateLoginAsyncAction =
      AsyncAction('LoginBase.checkStateLogin', context: context);

  @override
  Future<dynamic> checkStateLogin() {
    return _$checkStateLoginAsyncAction.run(() => super.checkStateLogin());
  }

  late final _$LoginBaseActionController =
      ActionController(name: 'LoginBase', context: context);

  @override
  void setCheckLoginState(bool value) {
    final _$actionInfo = _$LoginBaseActionController.startAction(
        name: 'LoginBase.setCheckLoginState');
    try {
      return super.setCheckLoginState(value);
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure() {
    final _$actionInfo =
        _$LoginBaseActionController.startAction(name: 'LoginBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo =
        _$LoginBaseActionController.startAction(name: 'LoginBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
email: ${email},
isLoading: ${isLoading},
isObscure: ${isObscure},
isCheckLoginState: ${isCheckLoginState}
    ''';
  }
}
