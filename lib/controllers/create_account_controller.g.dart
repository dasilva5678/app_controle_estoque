// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAccountController on CreateAccountBase, Store {
  late final _$isObscureAtom =
      Atom(name: 'CreateAccountBase.isObscure', context: context);

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

  late final _$isPasswordConfirmationObscureIconAtom = Atom(
      name: 'CreateAccountBase.isPasswordConfirmationObscureIcon',
      context: context);

  @override
  bool get isPasswordConfirmationObscureIcon {
    _$isPasswordConfirmationObscureIconAtom.reportRead();
    return super.isPasswordConfirmationObscureIcon;
  }

  @override
  set isPasswordConfirmationObscureIcon(bool value) {
    _$isPasswordConfirmationObscureIconAtom
        .reportWrite(value, super.isPasswordConfirmationObscureIcon, () {
      super.isPasswordConfirmationObscureIcon = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CreateAccountBase.isLoading', context: context);

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

  late final _$createAcountAsyncAction =
      AsyncAction('CreateAccountBase.createAcount', context: context);

  @override
  Future<void> createAcount(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required BuildContext context}) {
    return _$createAcountAsyncAction.run(() => super.createAcount(
        name: name,
        phone: phone,
        email: email,
        password: password,
        context: context));
  }

  late final _$CreateAccountBaseActionController =
      ActionController(name: 'CreateAccountBase', context: context);

  @override
  void setObscure() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordConfirmationObscure() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.passwordConfirmationObscure');
    try {
      return super.passwordConfirmationObscure();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscure: ${isObscure},
isPasswordConfirmationObscureIcon: ${isPasswordConfirmationObscureIcon},
isLoading: ${isLoading}
    ''';
  }
}
