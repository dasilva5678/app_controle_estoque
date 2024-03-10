import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_width.dart';

import 'package:flutter/material.dart';

Future<void> showDialogEdit({
  String? idUser,
  required String label,
  required Widget child,
  required BuildContext context,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: TextStyle(color: AppColors.blue),
                      ),
                      SizeBoxWidht.customSizedBox(context, 0.01),
                      Icon(
                        Icons.edit_note,
                        color: AppColors.blue,
                        size: 17,
                      ),
                    ],
                  ),
                  Divider(),
                  child,
                  // Center(
                  //   child: CustomButton(
                  //     label: textButton,
                  //     onTap: onPressed,
                  //     width: MediaQuery.of(context).size.width * 0.45,
                  //     height: MediaQuery.of(context).size.height * 0.04,
                  //     borderRadius: 30,
                  //     colorButton: AppColors.blue,
                  //     colorLabel: Colors.white,
                  //   ),
                  // ),
                  SizeBoxWidht.customSizedBox(context, 0.01),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
