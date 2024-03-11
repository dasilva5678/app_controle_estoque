// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/controllers/stock_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/view/stock/widgets/custom_card_product_widget.dart';
import 'package:app_controle_estoque/view/stock/widgets/data_stock_widget.dart';
import 'package:app_controle_estoque/view/stock/widgets/form_product.dart';
import 'package:app_controle_estoque/widgets/alert_dialog_delete_product.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/custom_loading.dart';
import 'package:app_controle_estoque/widgets/custom_show_dialog.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:app_controle_estoque/widgets/show_dialog_details_product.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StockView extends StatefulWidget {
  bool? isEdit;
  bool? isAdd;
  String? userId;
  String? auditId;
  StockView({
    Key? key,
    this.isEdit,
    this.isAdd,
    this.userId,
    this.auditId,
  }) : super(key: key);

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  final stockController = getIt<StockController>();

  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  void getAllProducts() async {
    await stockController.getAllProducts(context);
  }

  void deleteProduct(String stockId) {
    stockController.deleteProduct(stockId, context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final productPerAuditId = stockController.productList
          .where((element) => element.auditId == widget.auditId)
          .toList();
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customShowDialog(
              context: context,
              label: "Novo Item",
              child: FormEditProduct(
                auditId: widget.auditId,
                isAdd: true,
                isEdit: false,
                userId: widget.userId,
              ),
            );
          },
          backgroundColor: AppColors.darkBlue,
          child: const Icon(
            Icons.library_add_outlined,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Estoque",
            style: TextStyle(
              color: AppColors.darkBlue,
            ),
          ),
          backgroundColor: Colors.blueGrey.shade100,
          iconTheme: IconThemeData(color: AppColors.darkBlue),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: stockController.isLoading
                ? CustomIsLoading(message: "Carregando...")
                : Column(
                    children: [
                      SizeBoxHeight.customSizedBox(context, 0.02),
                      DataStockWidget(
                        data: "09/03/2024",
                        status: "Pendente",
                        unit: "Unidade 1",
                      ),
                      SizeBoxHeight.customSizedBox(context, 0.05),
                      Text(
                        'Itens em Estoque',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 20,
                        ),
                      ),
                      CustomDivider(),
                      SizeBoxHeight.customSizedBox(context, 0.05),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productPerAuditId.length,
                        itemBuilder: (context, index) {
                          final item = productPerAuditId[index];
                          return CustomCardProductWidget(
                            productModel: item,
                            toView: () {
                              showDialogDetailsProduct(
                                productModel: productPerAuditId[index],
                                context: context,
                                label: "Detalhes do Item",
                                textButton: "Ok",
                                onPressed: () {
                                  NavigationService.instance.goBack();
                                },
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                whidth: MediaQuery.of(context).size.width * 0.7,
                              );
                            },
                            edit: () {
                              customShowDialog(
                                context: context,
                                label: "Editar",
                                child: FormEditProduct(
                                  auditId: widget.auditId ?? "",
                                  isAdd: false,
                                  isEdit: true,
                                  userId: widget.userId ?? "",
                                  productId: item.id ?? "",
                                ),
                              );
                            },
                            delete: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteConfirmationDialog(
                                    name:
                                        "${productPerAuditId[index].nameProduct}",
                                    message: "Tem certeza que deseja excluir",
                                    onConfirm: () {
                                      deleteProduct(
                                          productPerAuditId[index].id!);
                                    },
                                    onCancel: () {
                                      NavigationService.instance.goBack();
                                    },
                                  );
                                },
                              );
                            },
                            onTap: () {},
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }

  Widget editProduct() {
    return Column(
      children: [
        CustomTextForm(
          controller: null,
          label: 'Nome',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Data de Validade',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Código de Barras',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Quantidade Embalagem',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Quantidade',
          fontSize: 12,
        ),
        SizedBox(
          height: 35,
        )
      ],
    );
  }

  Widget formAddItem() {
    return Column(
      children: [
        CustomTextForm(
          controller: null,
          label: 'Nome',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Data de Validade',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Código de Barras',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Quantidade Embalagem',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Quantidade',
          fontSize: 12,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
