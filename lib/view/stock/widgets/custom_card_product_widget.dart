// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_controle_estoque/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/core/utils/size_box_width.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:app_controle_estoque/widgets/menu_popup_button.dart';

class CustomCardProductWidget extends StatefulWidget {
  final void Function() toView;
  final void Function() edit;
  final void Function() delete;
  final void Function() onTap;
  final ProductModel productModel;
  CustomCardProductWidget({
    Key? key,
    required this.toView,
    required this.edit,
    required this.delete,
    required this.onTap,
    required this.productModel,
  }) : super(key: key);

  @override
  State<CustomCardProductWidget> createState() =>
      _CustomCardProductWidgetState();
}

class _CustomCardProductWidgetState extends State<CustomCardProductWidget> {
  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () async => widget.onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.darkBlue),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.productModel.nameProduct ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                            ],
                          ),
                          MenuPopupButton(
                            delete: widget.delete,
                            edit: () => widget.edit(),
                            toView: () => widget.toView(),
                          ),
                        ],
                      ),
                      CustomDivider(
                        color: AppColors.darkBlue,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Quantidade:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                              ),
                              SizeBoxWidht.customSizedBox(context, 0.040),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  widget.productModel.amount ?? "",
                                ),
                              ),
                            ],
                          ),
                          SizeBoxHeight.customSizedBox(context, 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Unidade:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blue),
                              ),
                              SizeBoxWidht.customSizedBox(context, 0.015),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  widget.productModel.quantityPerPack ?? "",
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
