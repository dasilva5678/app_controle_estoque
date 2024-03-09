// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double thickness;
  CustomDivider({
    Key? key,
    this.color = AppColors.grey,
    this.thickness = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
    );
  }
}
