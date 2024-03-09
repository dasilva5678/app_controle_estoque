import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizeBoxHeight.customSizedBox(context, 0.18),
              image(context),
              SizeBoxHeight.customSizedBox(context, 0.09),
              form(context),
              SizeBoxHeight.customSizedBox(context, 0.01),
              buttonCreateAccount(),
              SizeBoxHeight.customSizedBox(context, 0.01),
              Divider(
                color: Colors.grey.shade500,
                thickness: 1,
              ),
              SizeBoxHeight.customSizedBox(context, 0.05),
              buttonLogout(context),
              SizeBoxHeight.customSizedBox(context, 0.15),
              version(context),
              SizeBoxHeight.customSizedBox(context, 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget image(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/icon.png',
        width: MediaQuery.of(context).size.width * 0.35,
      ),
    );
  }

  Widget form(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          inputHeight: 50,
          borderRadius: 30,
          hintText: 'E-mail',
          label: 'E-mail',
          suffixIcon: Icon(
            Icons.email_outlined,
            color: AppColors.blue,
          ),
        ),
        SizeBoxHeight.customSizedBox(context, 0.03),
        CustomTextForm(
          inputHeight: 50,
          borderRadius: 30,
          hintText: 'Senha',
          label: 'Senha',
          suffixIcon: Icon(
            Icons.lock_outlined,
            color: AppColors.blue,
          ),
          prefixIcon: Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }

  Widget buttonLogout(BuildContext context) {
    return CustomButton(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      colorButton: AppColors.blue,
      colorLabel: Colors.white,
      borderRadius: 30,
      label: 'Entrar',
      onTap: () {},
    );
  }

  Widget buttonCreateAccount() {
    return TextButton(
      child: Text('Criar conta, clique aqui!'),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.blue,
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
      ),
      onPressed: () {},
    );
  }

  Widget version(BuildContext context) {
    return Center(
      child: Text(
        'Versão 1.0.0',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.03,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
