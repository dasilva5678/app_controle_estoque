// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String productName;
  final String message;
  final void Function() onConfirm;
  final void Function() onCancel;

  DeleteConfirmationDialog({
    Key? key,
    required this.productName,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirmar Exclusão'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('$message\n"$productName"?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(
            'Voltar',
            style: TextStyle(color: AppColors.blue),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
