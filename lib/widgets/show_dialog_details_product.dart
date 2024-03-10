import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Future<void> showDialogDetailsProduct({
  required BuildContext context,
  required String label,
  required String textButton,
  required double height,
  required double whidth,
  required void Function() onPressed,
}) async {
  final styleTitle = TextStyle(
    color: AppColors.blue,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  final styleItem = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 14,
  );
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizeBoxHeight.customSizedBox(context, 0.03),
          Text(
            label.toUpperCase(),
            style: TextStyle(color: AppColors.blue, fontSize: 16),
          ),
          SizeBoxHeight.customSizedBox(context, 0.04),
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          SizeBoxHeight.customSizedBox(context, 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Nome: ",
                      style: styleTitle,
                    ),
                    TextSpan(
                      text: "Produto teste",
                      style: styleItem,
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Código de Barras: ",
                      style: styleTitle,
                    ),
                    TextSpan(
                      text: "123456",
                      style: styleItem,
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Data de Validade: ",
                      style: styleTitle,
                    ),
                    TextSpan(
                      text: "10/02/2024",
                      style: styleItem,
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Quantidade por embalagem: ",
                      style: styleTitle,
                    ),
                    TextSpan(
                      text: "10",
                      style: styleItem,
                    ),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.visible,
                softWrap: true,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Quantidade: ",
                      style: styleTitle,
                    ),
                    TextSpan(
                      text: "5",
                      style: styleItem,
                    ),
                  ],
                ),
              ),
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
  );
}
