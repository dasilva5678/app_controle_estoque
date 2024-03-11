// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockController on StockBase, Store {
  late final _$productListAtom =
      Atom(name: 'StockBase.productList', context: context);

  @override
  List<ProductModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<ProductModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$productModelAtom =
      Atom(name: 'StockBase.productModel', context: context);

  @override
  ProductModel get productModel {
    _$productModelAtom.reportRead();
    return super.productModel;
  }

  @override
  set productModel(ProductModel value) {
    _$productModelAtom.reportWrite(value, super.productModel, () {
      super.productModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'StockBase.isLoading', context: context);

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

  late final _$createProductAsyncAction =
      AsyncAction('StockBase.createProduct', context: context);

  @override
  Future<void> createProduct(
      {required String nameProduct,
      required String quantityPerPack,
      required String amount,
      required String barCode,
      required String auditId,
      required String userID,
      required String expirationDate,
      required BuildContext context}) {
    return _$createProductAsyncAction.run(() => super.createProduct(
        nameProduct: nameProduct,
        quantityPerPack: quantityPerPack,
        amount: amount,
        barCode: barCode,
        auditId: auditId,
        userID: userID,
        expirationDate: expirationDate,
        context: context));
  }

  late final _$updateProductAsyncAction =
      AsyncAction('StockBase.updateProduct', context: context);

  @override
  Future<void> updateProduct(
      {required BuildContext context,
      String? id,
      String? nameProduct,
      String? quantityPerPack,
      String? amount,
      String? barCode,
      String? auditId,
      String? userID,
      String? expirationDate}) {
    return _$updateProductAsyncAction.run(() => super.updateProduct(
        context: context,
        id: id,
        nameProduct: nameProduct,
        quantityPerPack: quantityPerPack,
        amount: amount,
        barCode: barCode,
        auditId: auditId,
        userID: userID,
        expirationDate: expirationDate));
  }

  late final _$StockBaseActionController =
      ActionController(name: 'StockBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo =
        _$StockBaseActionController.startAction(name: 'StockBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$StockBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList},
productModel: ${productModel},
isLoading: ${isLoading}
    ''';
  }
}
