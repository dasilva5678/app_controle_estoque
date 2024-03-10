import 'package:app_controle_estoque/view/home/widgets/custom_card_audit.dart';
import 'package:flutter/material.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardAudit(
          status: "Concluído",
          date: '10/10/2022',
          unit: 'Unidade 1',
          edit: () {},
          delete: () {},
          onTap: () {},
        ),
        CustomCardAudit(
          status: "Pendente",
          date: '10/10/2022',
          unit: 'Unidade 1',
          edit: () {},
          delete: () {},
          onTap: () {},
        ),
      ],
    );
  }
}
