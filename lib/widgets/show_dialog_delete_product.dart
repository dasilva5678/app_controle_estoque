// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String name;
  final String message;
  final void Function() onConfirm;
  final void Function() onCancel;

  DeleteConfirmationDialog({
    Key? key,
    required this.name,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(
            'Confirmar Exclusão',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.delete_forever_rounded,
            color: Colors.red,
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              '$message\n"$name"?',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 15,
              ),
            ),
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
            'Sim',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
