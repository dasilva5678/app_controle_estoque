import 'package:app_controle_estoque/core/errors/custom_exception.dart';
import 'package:app_controle_estoque/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class StockService {
  late Box stockBox;

  Future<void> startBox() async {
    stockBox = await Hive.openBox('stockBox');
  }

  Future<Map<dynamic, dynamic>> createProduct(ProductModel product) async {
    try {
      await startBox();

      final newProduct = ProductModel(
        id: const Uuid().v1(),
        nameProduct: product.nameProduct,
        quantityPerPack: product.quantityPerPack,
        amount: product.amount,
        barCode: product.barCode,
        auditId: product.auditId,
        userID: product.userID,
        expirationDate: product.expirationDate,
      );
      await stockBox.put(newProduct.id, newProduct.toMap());

      return await stockBox.get(newProduct.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<ProductModel> getProduct(String produtoId) async {
    try {
      await startBox();
      final productData = await stockBox.get(produtoId);

      if (productData == null) {
        throw AuditNotFound();
      }

      final audit = await ProductModel.fromMap(productData);
      return audit;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      await startBox();
      List<ProductModel> productModelList = [];

      final getAllProductKeys = stockBox.keys;

      for (var data in getAllProductKeys) {
        productModelList.add(ProductModel.fromMap(await stockBox.get(data)));
      }

      return productModelList;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<Map<dynamic, dynamic>> updateProduct(ProductModel product) async {
    try {
      await startBox();
      final updateAudit = ProductModel(
        id: product.id,
        nameProduct: product.nameProduct,
        quantityPerPack: product.quantityPerPack,
        amount: product.amount,
        barCode: product.barCode,
        auditId: product.auditId,
        userID: product.userID,
        expirationDate: product.expirationDate,
      );

      final getAllAuditkeys = stockBox.keys.toList();

      getAllAuditkeys.forEach((element) {
        if (element == updateAudit.id) {
          final index = getAllAuditkeys.indexOf(element);
          stockBox.putAt(index, updateAudit.toMap());
        }
      });

      return await stockBox.get(updateAudit.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<bool> deleteProduct(String stockId) async {
    try {
      await startBox();

      bool isDelete = false;

      await stockBox.delete(stockId);

      final auditExists = await stockBox.get(stockId);

      if (auditExists == null) {
        isDelete = true;
      }

      return isDelete;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }
}
