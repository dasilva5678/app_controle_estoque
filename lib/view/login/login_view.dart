import 'package:app_controle_estoque/controllers/login_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/custom_image.dart';
import 'package:app_controle_estoque/widgets/custom_loading.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final loginController = getIt<LoginControler>();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginController.checkStateLogin();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> logar() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await loginController.login(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: loginController.isLoading
                ? Center(
                    child: CustomIsLoading(
                      message: 'Carregando...',
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizeBoxHeight.customSizedBox(context, 0.18),
                      CustomLogoImage(image: 'assets/images/icon.png'),
                      SizeBoxHeight.customSizedBox(context, 0.09),
                      _buildForm(context, loginController),
                      SizeBoxHeight.customSizedBox(context, 0.01),
                      buildButtonCreateAccount(),
                      SizeBoxHeight.customSizedBox(context, 0.01),
                      CustomDivider(),
                      SizeBoxHeight.customSizedBox(context, 0.05),
                      _buildButtonLogout(context),
                      SizeBoxHeight.customSizedBox(context, 0.15),
                      version(context),
                      SizeBoxHeight.customSizedBox(context, 0.05),
                    ],
                  ),
          ),
        ),
      );
    });
  }

  Widget _buildForm(BuildContext context, LoginControler controller) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: emailController,
            inputHeight: 70,
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
          SizeBoxHeight.customSizedBox(context, 0.005),
          CustomTextForm(
            controller: passwordController,
            inputHeight: 70,
            borderRadius: 30,
            hintText: 'Senha',
            label: 'Senha',
            suffixIcon: Icon(
              Icons.lock_outlined,
              color: AppColors.blue,
            ),
            obscureText: controller.isObscure,
            prefixIcon: IconButton(
              icon: Icon(
                controller.isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color:
                    controller.isObscure ? AppColors.darkBlue : AppColors.blue,
              ),
              onPressed: () => controller.setObscure(),
            ),
            validator: Validatorless.multiple([
              Validatorless.required('Por favor digite sua senha'),
              Validatorless.min(
                  6, 'Sua senha precisa ter no mínimo 6 caracteres'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonLogout(BuildContext context) {
    return CustomButton(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      colorButton: AppColors.blue,
      colorLabel: Colors.white,
      borderRadius: 30,
      label: 'Entrar',
      onTap: () async => await logar(),
    );
  }

  Widget buildButtonCreateAccount() {
    return TextButton(
      child: Text('Criar conta, clique aqui!'),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.blue,
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
      ),
      onPressed: () {
        NavigationService.instance.navigateTo(EnumRoutes.createAccount);
      },
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
