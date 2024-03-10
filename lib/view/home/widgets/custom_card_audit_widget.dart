// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_width.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomCardAudit extends StatefulWidget {
  final String status;
  final String date;
  final String unit;
  final void Function() edit;
  final void Function() delete;
  final void Function() onTap;
  CustomCardAudit({
    Key? key,
    required this.status,
    required this.date,
    required this.unit,
    required this.edit,
    required this.delete,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomCardAudit> createState() => _CustomCardAuditState();
}

class _CustomCardAuditState extends State<CustomCardAudit> {
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
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: homeController.getColor(widget.status),
                              ),
                              SizeBoxWidht.customSizedBox(context, 0.01),
                              Text(
                                widget.status,
                                style: TextStyle(
                                  color: homeController.getColor(widget.status),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () => widget.delete(),
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () => widget.edit(),
                                icon: Icon(
                                  Icons.edit_note,
                                  color: AppColors.blue,
                                  size: 30,
                                ),
                              ),
                            ],
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
                                'Data:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                              ),
                              SizeBoxWidht.customSizedBox(context, 0.040),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  widget.date,
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
                                  widget.unit,
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
