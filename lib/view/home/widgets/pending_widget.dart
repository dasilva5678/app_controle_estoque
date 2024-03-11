// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/view/home/widgets/custom_card_audit_widget.dart';
import 'package:app_controle_estoque/view/home/widgets/form_audit.dart';
import 'package:app_controle_estoque/widgets/alert_dialog_delete_product.dart';
import 'package:app_controle_estoque/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:app_controle_estoque/models/audit_model.dart';

class PendingWidget extends StatelessWidget {
  final List<AuditModel> listAudit;
  PendingWidget({
    Key? key,
    required this.listAudit,
  }) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listAudit.length,
      itemBuilder: (context, index) {
        final item = listAudit[index];
        return CustomCardAudit(
          audit: item,
          edit: () {
            customShowDialog(
              label: "Editar",
              idUser: item.userID ?? "",
              context: context,
              child: FormAudit(
                auditId: item.id ?? "",
                isAdd: false,
                isEdit: true,
                userId: item.userID ?? "",
              ),
            );
          },
          delete: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeleteConfirmationDialog(
                  name: item.unit ?? "",
                  message: "Tem certeza que deseja ",
                  onConfirm: () {
                    homeController.deleteAudit(item.id!, context);
                    NavigationService.instance.navigateTo(EnumRoutes.home);
                  },
                  onCancel: () {
                    NavigationService.instance.goBack();
                  },
                );
              },
            );
          },
          onTap: () {
            NavigationService.instance.navigateTo(EnumRoutes.stock, arguments: {
              "auditId": item.id,
              "userId": item.userID,
            });
          },
        );
      },
    );
  }
}
