import 'package:app_controle_estoque/controllers/create_account_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/custom_image.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final createAccountController = getIt<CreateAccountController>();

  final _formKey = GlobalKey<FormState>();

  void createAccount() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar conta',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizeBoxHeight.customSizedBox(context, 0.10),
              CustomLogoImage(image: "assets/images/create_account.png"),
              SizeBoxHeight.customSizedBox(context, 0.05),
              _buildForm(),
              SizeBoxHeight.customSizedBox(context, 0.02),
              CustomDivider(),
              SizeBoxHeight.customSizedBox(context, 0.02),
              _builButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: createAccountController.nameController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'Nome',
            label: 'Nome',
            suffixIcon: Icon(
              Icons.person_outline,
              color: AppColors.blue,
            ),
          ),
          CustomTextForm(
            controller: createAccountController.phoneController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'Celular',
            label: 'Celular',
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(
              Icons.phone_android,
              color: AppColors.blue,
            ),
            inputFormatters: [
              MaskTextInputFormatter(mask: "(##) ####-####"),
            ],
          ),
          CustomTextForm(
            controller: createAccountController.emailController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'E-mail',
            label: 'E-mail',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: AppColors.blue,
            ),
            validator: Validatorless.multiple([
              Validatorless.required('Por favor digite seu e-mail'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          CustomTextForm(
            controller: createAccountController.passwordController,
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
            validator: Validatorless.multiple([
              Validatorless.required('Por favor digite sua senha'),
              Validatorless.min(
                  6, 'Sua senha precisa ter no mínimo 6 caracteres'),
            ]),
          ),
          CustomTextForm(
            controller: createAccountController.confirmPasswordController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'Confirmação de senha',
            label: 'Confirmação de senha',
            suffixIcon: Icon(
              Icons.lock_outlined,
              color: AppColors.blue,
            ),
            prefixIcon: Icon(
              Icons.remove_red_eye_outlined,
              color: AppColors.blue,
            ),
            validator: Validatorless.compare(
              createAccountController.confirmPasswordController,
              'As senhas não são iguais!',
            ),
          ),
        ],
      ),
    );
  }

  Widget _builButton() {
    return CustomButton(
      label: 'Criar conta',
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      borderRadius: 30,
      onTap: () {
        createAccount();
      },
      colorButton: AppColors.blue,
      colorLabel: Colors.white,
    );
  }
}
