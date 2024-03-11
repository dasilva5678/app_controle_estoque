// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/models/product_model.dart';
import 'package:app_controle_estoque/widgets/custom_showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:app_controle_estoque/services/stock_service.dart';

part 'stock_controller.g.dart';

class StockController = StockBase with _$StockController;

abstract class StockBase with Store {
  final StockService stockService;
  StockBase({
    required this.stockService,
  });

  @observable
  List<ProductModel> productList = [];

  @observable
  ProductModel productModel = ProductModel();

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> createProduct({
    required String nameProduct,
    required String quantityPerPack,
    required String amount,
    required String barCode,
    required String auditId,
    required String userID,
    required String expirationDate,
    required BuildContext context,
  }) async {
    setLoading(true);

    final product = ProductModel(
      nameProduct: nameProduct,
      quantityPerPack: quantityPerPack,
      amount: amount,
      barCode: barCode,
      auditId: auditId,
      userID: userID,
      expirationDate: expirationDate,
    );
    final result =
        await stockService.createProduct(product).onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
      setLoading(false);
      return {};
    });

    if (result.isNotEmpty) {
      setLoading(false);
      NavigationService.instance.navigateTo(EnumRoutes.stock, arguments: {
        "auditId": result["auditId"],
        "userId": result["userID"],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: "Produto criado com sucesso",
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.blue,
        ),
      );
    }
  }

  Future<void> getProduct(BuildContext context, String productId) async {
    productList.clear();

    final result = await stockService.getProduct(productId).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );

        return ProductModel();
      },
    );

    if (result.id != null) {
      productModel = result;
    }
  }

  Future<void> getAllProducts(BuildContext context) async {
    productList.clear();

    setLoading(true);
    final result = await stockService.getAllProducts().onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return [];
      },
    );

    if (result.isNotEmpty) {
      productList = result;

      setLoading(false);
    }
  }

  @action
  Future<void> updateProduct({
    required BuildContext context,
    String? id,
    String? nameProduct,
    String? quantityPerPack,
    String? amount,
    String? barCode,
    String? auditId,
    String? userID,
    String? expirationDate,
  }) async {
    setLoading(true);

    final updateProduct = ProductModel(
      id: id,
      nameProduct: nameProduct,
      quantityPerPack: quantityPerPack,
      amount: amount,
      barCode: barCode,
      auditId: auditId,
      userID: userID,
      expirationDate: expirationDate,
    );
    if (updateProduct.id == null) {
      setLoading(false);
      return;
    }
    final result = await stockService
        .updateProduct(updateProduct)
        .onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Aviso',
          label: error.toString(),
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: Colors.red,
        ),
      );
      setLoading(false);
      return {};
    });
    if (result.isNotEmpty) {
      setLoading(false);

      getAllProducts(context);
      NavigationService.instance.goBack();
      // NavigationService.instance.navigateTo(EnumRoutes.stock, arguments: {
      //   "auditId": null,
      //   "userId": null,
      // });
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: "Produto atualizado com sucesso",
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.blue,
        ),
      );
    }

    print("Result: ${result}");
  }

  Future<void> deleteProduct(String stockId, BuildContext context) async {
    setLoading(true);
    final result = await stockService.deleteProduct(stockId).onError(
      (error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarDialog(
            title: 'Aviso',
            label: error.toString(),
            icon: Icons.check_circle_outline,
            textColorLabel: Colors.white,
            backgroundColor: Colors.red,
          ),
        );
        setLoading(false);
        return false;
      },
    );
    if (result == true) {
      setLoading(false);
      getAllProducts(context);
      NavigationService.instance.navigateTo(EnumRoutes.stock, arguments: {
        "auditId": null,
        "userId": null,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarDialog(
          title: 'Sucesso',
          label: "Produto excluido com sucesso",
          icon: Icons.check_circle_outline,
          textColorLabel: Colors.white,
          backgroundColor: AppColors.blue,
        ),
      );
    }
  }
}
