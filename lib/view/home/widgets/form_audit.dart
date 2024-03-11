// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_controle_estoque/core/routes/app_routes.dart';
import 'package:app_controle_estoque/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/widgets/custom_dropdown.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';

// ignore: must_be_immutable
class FormAudit extends StatefulWidget {
  bool? isEdit;
  bool? isAdd;
  String? userId;
  String? auditId;

  FormAudit({
    Key? key,
    this.isEdit = false,
    this.isAdd = false,
    this.userId,
    this.auditId,
  }) : super(key: key);

  @override
  State<FormAudit> createState() => _FormAuditState();
}

class _FormAuditState extends State<FormAudit> {
  final dataController = TextEditingController();
  final unitController = TextEditingController();
  final auditController = TextEditingController();

  final homeController = getIt<HomeController>();
  final formKey = GlobalKey<FormState>();

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    homeController.getLocalUser();
    isEditOrCreate();
  }

  void isEditOrCreate() async {
    if (widget.isEdit == true) {
      await homeController.getAudit(widget.auditId!, context);

      homeController.status.forEach(
        (element) {
          if (element.toLowerCase() ==
              homeController.auditModel.status!.toLowerCase()) {
            setState(() {
              selectedValue = element;
            });
          }
        },
      );

      dataController.text = homeController.auditModel.date == "" ||
              homeController.auditModel.date == null
          ? ""
          : homeController.auditModel.date!;
      unitController.text = homeController.auditModel.unit == "" ||
              homeController.auditModel.unit == null
          ? ""
          : homeController.auditModel.unit!;
    } else {
      selectedValue = homeController.status[0];
      dataController.clear();
      unitController.clear();
      auditController.clear();
    }
  }

  void saveAudit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    homeController.createAudit(
      userID: homeController.userCache.id,
      status: selectedValue,
      unit: unitController.text,
      date: dataController.text,
      context: context,
    );
  }

  void editAudit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    homeController.updateAudit(
      userID: widget.userId,
      id: widget.auditId,
      status: selectedValue,
      unit: unitController.text,
      date: dataController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextForm(
            controller: dataController,
            inputHeight: 60,
            label: 'Data',
            fontSize: 12,
            keyboardType: TextInputType.datetime,
            inputFormatters: [
              MaskTextInputFormatter(mask: "##/##/####"),
            ],
            validator: Validatorless.multiple([
              Validatorless.required('Informe a data'),
            ]),
          ),
          CustomTextForm(
            controller: unitController,
            inputHeight: 60,
            label: 'Unidade',
            fontSize: 12,
            keyboardType: TextInputType.text,
            validator: Validatorless.multiple([
              Validatorless.required('Informe a unidade'),
            ]),
          ),
          SizeBoxHeight.customSizedBox(context, 0.01),
          CustomDropdownFormField(
            items: homeController.status.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: TextStyle(fontSize: 16, color: AppColors.blue),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value.toString();
              });
            },
            value: selectedValue,
          ),
          SizeBoxHeight.customSizedBox(context, 0.05),
          Center(
            child: CustomButton(
              label:
                  widget.isAdd == true ? 'Nova Auditoria' : 'Editar Auditoria',
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.04,
              borderRadius: 30,
              colorButton: AppColors.blue,
              colorLabel: Colors.white,
              onTap: () {
                if (widget.isAdd == true) {
                  saveAudit();
                } else {
                  editAudit();
                }
                NavigationService.instance.goBack();
              },
            ),
          ),
          SizeBoxHeight.customSizedBox(context, 0.05),
        ],
      ),
    );
  }
}
