import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/view/stock/widgets/custom_card_product_widget.dart';
import 'package:app_controle_estoque/view/stock/widgets/data_stock_widget.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/show_dialog_delete_product.dart';
import 'package:app_controle_estoque/widgets/show_dialog_details_product.dart';
import 'package:app_controle_estoque/widgets/show_dialog_edit_product.dart';
import 'package:flutter/material.dart';

class StockView extends StatelessWidget {
  const StockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estoque", style: TextStyle(color: AppColors.darkBlue)),
        backgroundColor: Colors.blueGrey.shade100,
        iconTheme: IconThemeData(color: AppColors.darkBlue),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
            SizeBoxHeight.customSizedBox(context, 0.05),
            CustomCardProductWidget(
              toView: () {
                showDialogDetailsProduct(
                  context: context,
                  label: "Detalhes do Item",
                  textButton: "Ok",
                  onPressed: () {
                    NavigationService.instance.goBack();
                  },
                  height: MediaQuery.of(context).size.height * 0.5,
                  whidth: MediaQuery.of(context).size.width * 0.7,
                );
              },
              edit: () {
                showDialogEditProduct(
                  context: context,
                  label: "Editar Item",
                  textButton: "Salvar",
                  onPressed: () {
                    NavigationService.instance.goBack();
                  },
                  height: MediaQuery.of(context).size.height * 0.5,
                  whidth: MediaQuery.of(context).size.width * 0.7,
                );
              },
              delete: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteConfirmationDialog(
                      productName: "Produto Teste",
                      message: "Tem certeza que deseja excluir, ",
                      onConfirm: () {},
                      onCancel: () {},
                    );
                  },
                );
              },
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
