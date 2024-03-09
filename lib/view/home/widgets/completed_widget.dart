import 'package:app_controle_estoque/view/home/widgets/custom_card_items.dart';
import 'package:flutter/material.dart';

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCardAudit(
        date: '10/10/2022',
        unit: 'Unidade 1',
      ),
    );
  }
}
