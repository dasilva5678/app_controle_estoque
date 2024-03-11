// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:app_controle_estoque/controllers/stock_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';

// ignore: must_be_immutable
class FormEditProduct extends StatefulWidget {
  bool? isEdit;
  bool? isAdd;
  String? userId;
  String? auditId;
  String? productId;
  FormEditProduct({
    Key? key,
    this.isEdit = false,
    this.isAdd = false,
    this.userId,
    this.auditId,
    this.productId,
  }) : super(key: key);

  @override
  State<FormEditProduct> createState() => _FormEditProductState();
}

class _FormEditProductState extends State<FormEditProduct> {
  final nomeController = TextEditingController();
  final dataValidadeController = TextEditingController();
  final codBarrasController = TextEditingController();
  final quantidadeEmbalagemController = TextEditingController();
  final quantidadeController = TextEditingController();

  final stockController = getIt<StockController>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    editOrController();
  }

  Future<void> getProduct() async {
    await stockController.getProduct(context, widget.productId ?? "");
  }

  Future<void> createProduct() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await stockController.createProduct(
      nameProduct: nomeController.text,
      expirationDate: dataValidadeController.text,
      barCode: codBarrasController.text,
      quantityPerPack: quantidadeEmbalagemController.text,
      amount: quantidadeController.text,
      userID: widget.userId ?? '',
      auditId: widget.auditId ?? '',
      context: context,
    );
  }

  Future<void> editProduct() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await stockController.updateProduct(
      id: widget.productId ?? '',
      nameProduct: nomeController.text,
      expirationDate: dataValidadeController.text,
      barCode: codBarrasController.text,
      quantityPerPack: quantidadeEmbalagemController.text,
      amount: quantidadeController.text,
      userID: widget.userId ?? '',
      auditId: widget.auditId ?? '',
      context: context,
    );
  }

  void editOrController() async {
    if (widget.isEdit == true) {
      await getProduct();
      print(
          "widget.productModel?.nameProduct ${stockController.productModel.nameProduct}");
      nomeController.text = stockController.productModel.nameProduct == null
          ? ""
          : stockController.productModel.nameProduct!;
      dataValidadeController.text =
          stockController.productModel.expirationDate == null
              ? ""
              : stockController.productModel.expirationDate!;
      codBarrasController.text = stockController.productModel.barCode == null
          ? ""
          : stockController.productModel.barCode!;
      quantidadeEmbalagemController.text =
          stockController.productModel.quantityPerPack == null
              ? ""
              : stockController.productModel.quantityPerPack!;
      quantidadeController.text = stockController.productModel.amount == null
          ? ""
          : stockController.productModel.amount!;
    } else {
      nomeController.clear();
      dataValidadeController.clear();
      codBarrasController.clear();
      quantidadeEmbalagemController.clear();
      quantidadeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextForm(
                controller: nomeController,
                label: 'Nome',
                fontSize: 12,
              ),
              CustomTextForm(
                controller: dataValidadeController,
                label: 'Data de Validade',
                fontSize: 12,
              ),
              CustomTextForm(
                controller: codBarrasController,
                label: 'Código de Barras',
                fontSize: 12,
              ),
              CustomTextForm(
                controller: quantidadeEmbalagemController,
                label: 'Quantidade Embalagem',
                fontSize: 12,
              ),
              CustomTextForm(
                controller: quantidadeController,
                label: 'Quantidade',
                fontSize: 12,
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: CustomButton(
                  label:
                      widget.isAdd == true ? 'Novo Produto' : 'Editar Produto',
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.04,
                  borderRadius: 30,
                  colorButton: AppColors.blue,
                  colorLabel: Colors.white,
                  onTap: () {
                    widget.isEdit == true ? editProduct() : createProduct();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}