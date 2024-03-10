// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/view/home/widgets/custom_card_audit_widget.dart';
import 'package:app_controle_estoque/widgets/show_dialog_delete_product.dart';
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/models/audit_model.dart';

class PendingWidget extends StatelessWidget {
  final List<AuditModel> listAudit;
   PendingWidget({
    Key? key,
    required this.listAudit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listAudit.length,
      itemBuilder: (context, index) {
        final item = listAudit[index];
        return CustomCardAudit(
         
          audit: item,
          edit: () {},
          delete: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeleteConfirmationDialog(
                  name: item.unit ?? "",
                  message: "Tem certeza que deseja ",
                  onConfirm: () {},
                  onCancel: () {},
                );
              },
            );
          },
          onTap: () {},
        );
        ;
      },
    );
  }
}
