// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String? value;

  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;

  const CustomDropdownFormField({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: AppColors.blue,
        ),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(color: AppColors.blue, fontSize: 18),
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 2),
          focusedBorder: InputBorder.none,
        ),
        value: value,
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
