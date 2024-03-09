import 'package:app_controle_estoque/controllers/create_account_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/custom_image.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final createAccountController = getIt<CreateAccountController>();

  void createAccount() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await createAccountController.createAcount(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
    });
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: nameController,
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
            controller: phoneController,
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
            controller: emailController,
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
            controller: passwordController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'Senha',
            label: 'Senha',
            suffixIcon: Icon(
              Icons.lock_outlined,
              color: AppColors.blue,
            ),
            obscureText: createAccountController.isObscure,
            prefixIcon: IconButton(
              icon: Icon(
                createAccountController.isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: createAccountController.isObscure
                    ? AppColors.darkBlue
                    : AppColors.blue,
              ),
              onPressed: () => createAccountController.setObscure(),
            ),
            validator: Validatorless.multiple([
              Validatorless.required('Por favor digite sua senha'),
              Validatorless.min(
                  6, 'Sua senha precisa ter no mínimo 6 caracteres'),
            ]),
          ),
          CustomTextForm(
            controller: confirmPasswordController,
            inputHeight: 50,
            borderRadius: 30,
            hintText: 'Confirmação de senha',
            label: 'Confirmação de senha',
            suffixIcon: Icon(
              Icons.lock_outlined,
              color: AppColors.blue,
            ),
            obscureText:
                createAccountController.isPasswordConfirmationObscureIcon,
            prefixIcon: IconButton(
              icon: Icon(
                createAccountController.isPasswordConfirmationObscureIcon
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: createAccountController.isPasswordConfirmationObscureIcon
                    ? AppColors.darkBlue
                    : AppColors.blue,
              ),
              onPressed: () =>
                  createAccountController.passwordConfirmationObscure(),
            ),
            validator: Validatorless.compare(
              passwordController,
              'Senhas não conferem!',
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
      onTap: () async => createAccount(),
      colorButton: AppColors.blue,
      colorLabel: Colors.white,
    );
  }
}
