import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

Future<void> showDialogEditProduct({
  required BuildContext context,
  required String label,
  required String textButton,
  int? maxLines = 8,
  required double height,
  required double whidth,
  bool message = false,
  required void Function() onPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: height,
        width: whidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                CustomTextForm(
                  controller: null,
                  label: 'Nome',
                  fontSize: 12,
                ),
                CustomTextForm(
                  controller: null,
                  label: 'Data de Validade',
                  fontSize: 12,
                ),
                CustomTextForm(
                  controller: null,
                  label: 'Código de Barras',
                  fontSize: 12,
                ),
                CustomTextForm(
                  controller: null,
                  label: 'Quantidade Embalagem',
                  fontSize: 12,
                ),
                CustomTextForm(
                  controller: null,
                  label: 'Quantidade',
                  fontSize: 12,
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: CustomButton(
                    label: textButton,
                    onTap: onPressed,
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.04,
                    borderRadius: 30,
                    colorButton: AppColors.blue,
                    colorLabel: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
