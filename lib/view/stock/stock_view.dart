// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/models/product_model.dart';
import 'package:app_controle_estoque/widgets/custom_app_bar.dart';
import 'package:app_controle_estoque/widgets/custom_drawer.dart';
import 'package:app_controle_estoque/widgets/custom_messagem.dart';
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

import 'package:app_controle_estoque/widgets/show_dialog_details_product.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
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
  final homeController = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    getAllAudit();
    getProducts();
  }

  void getProducts() {
    stockController.getAllProducts(context);
  }

  void getAllAudit() {
    homeController.getAudit(widget.auditId!, context);
  }

  void deleteProduct({
    required String stockId,
    required String auditId,
    required String userID,
  }) {
    stockController.deleteProduct(
      stockId: stockId,
      context: context,
      auditId: auditId,
      userID: userID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final productPerAuditId = stockController.productList
            .where((element) => element.auditId == widget.auditId)
            .toList();
        return PopScope(
          canPop: false,
          child: Scaffold(
            endDrawer: CustomMenuDrawer(),
            floatingActionButton: newItem(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: CustomAppBar(
                isleading: true,
                title: "Estoque",
                onPressed: () {
                  NavigationService.instance.navigateTo(EnumRoutes.home);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: stockController.isLoading
                    ? CustomIsLoading(
                        message: "Carregando...",
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizeBoxHeight.customSizedBox(context, 0.02),
                          DataStockWidget(
                            data: homeController.auditModel.date ?? "",
                            status: homeController.auditModel.status ?? "",
                            unit: homeController.auditModel.unit ?? "",
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
                          productPerAuditId.isEmpty
                              ? Center(
                                  child: CustomMessage(
                                    paddingTop: 150,
                                    message: "Nenhum produto cadastrado!",
                                  ),
                                )
                              : lisProducts(productPerAuditId),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget newItem() {
    return FloatingActionButton(
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
    );
  }

  Widget lisProducts(List<ProductModel> productPerAuditId) {
    return ListView.builder(
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
              height: MediaQuery.of(context).size.height * 0.4,
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
                  name: "${productPerAuditId[index].nameProduct}",
                  message: "Tem certeza que deseja excluir",
                  onConfirm: () {
                    deleteProduct(
                      auditId: productPerAuditId[index].auditId!,
                      userID: productPerAuditId[index].userID!,
                      stockId: productPerAuditId[index].id!,
                    );
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
    );
  }
}
