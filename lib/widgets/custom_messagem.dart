// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class CustomMessage extends StatelessWidget {
  final String message;
  final double? paddingTop;
  CustomMessage({
    Key? key,
    required this.message,
    required this.paddingTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${message}", style: TextStyle(color: AppColors.darkBlue)),
            SizedBox(width: 5),
            Icon(
              Icons.error_outline,
              color: AppColors.darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
