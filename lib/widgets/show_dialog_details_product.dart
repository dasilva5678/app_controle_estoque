import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Future<void> showDialogDetailsProduct({
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
            SizeBoxHeight.customSizedBox(context, 0.08),
            Text("PRODUTO"),
            Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(),
                Text("Nome: Teste"),
                Text("Código de Barras: 1234"),
                Text("Data de Validade: 10/03/2023"),
                Text("Quantidade por embalagem: 5"),
                Text("Quantidade: 10"),
                SizeBoxHeight.customSizedBox(context, 0.06),
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
