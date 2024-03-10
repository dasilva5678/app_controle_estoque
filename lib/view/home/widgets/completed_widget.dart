import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/view/home/widgets/custom_card_audit_widget.dart';
import 'package:flutter/material.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardAudit(
          status: "Enviado",
          date: '10/10/2022',
          unit: 'Unidade 1',
          edit: () {},
          delete: () {},
          onTap: () {},
        ),
        CustomCardAudit(
          status: "Pendente",
          date: '10/10/2024',
          unit: 'Unidade 2',
          edit: () {},
          delete: () {},
          onTap: () {
            NavigationService.instance.navigateTo(EnumRoutes.stock);
          },
        ),
      ],
    );
  }
}
