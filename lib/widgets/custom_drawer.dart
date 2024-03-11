import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/core/utils/size_box_width.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomMenuDrawer extends StatefulWidget {
  const CustomMenuDrawer({super.key});

  @override
  State<CustomMenuDrawer> createState() => _CustomMenuDrawerState();
}

class _CustomMenuDrawerState extends State<CustomMenuDrawer> {
  final homeController = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    homeController.getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: drawer(),
    );
  }

  Widget drawer() {
    return Observer(
      builder: (context) {
        return Drawer(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 206, 210, 212),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.020,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizeBoxHeight.customSizedBox(context, 0.04),
                  Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    "Controle de Estoque",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizeBoxHeight.customSizedBox(context, 0.04),
                  CustomDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: AppColors.blue,
                            size: 40,
                          ),
                        ),
                        SizeBoxWidht.customSizedBox(context, 0.02),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            "${homeController.userCache.name ?? ""}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 5, color: Colors.grey, thickness: 2),
                  Spacer(),
                  SizeBoxHeight.customSizedBox(context, 0.04),
                  CustomButton(
                    label: "Logout",
                    onTap: () {
                      NavigationService.instance.navigateTo(EnumRoutes.login);
                    },
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.04,
                    borderRadius: 30,
                    colorButton: AppColors.darkBlue,
                    colorLabel: Colors.white,
                  ),
                  SizeBoxHeight.customSizedBox(context, 0.20),
                  Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    "Versão 1.0.0",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizeBoxHeight.customSizedBox(context, 0.04),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
