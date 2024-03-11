// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class MenuPopupButton extends StatefulWidget {
  final void Function() toView;
  final void Function() edit;
  final void Function() delete;

  MenuPopupButton({
    Key? key,
    required this.toView,
    required this.edit,
    required this.delete,
  }) : super(key: key);

  @override
  State<MenuPopupButton> createState() => _MenuPopupButtonState();
}

class _MenuPopupButtonState extends State<MenuPopupButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: Color.fromARGB(255, 236, 235, 235),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.35,
          minWidth: MediaQuery.of(context).size.width * 0.20,
          maxHeight: MediaQuery.of(context).size.height * 0.25,
          minHeight: MediaQuery.of(context).size.height * 0.20),
      icon: Icon(
        Icons.more_horiz,
        color: AppColors.blue,
      ),
      onSelected: (value) {
        switch (value) {
          case 0:
            return widget.toView();
          case 1:
            return widget.edit();
          case 2:
            return widget.delete();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: _textMenuItem(
            title: 'Visualizar',
            icon: Icons.remove_red_eye,
            color: AppColors.blue,
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: _textMenuItem(
            title: 'Editar',
            icon: Icons.edit_document,
            color: AppColors.darkBlue,
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: _textMenuItem(
            title: 'Deletar',
            icon: Icons.delete_forever_sharp,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _textMenuItem({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(icon, color: color, size: 20),
              ),
              Text(
                title,
              ),
            ],
          ),
        ),
        CustomDivider(
          color: AppColors.darkBlue,
          thickness: 1,
        ),
      ],
    );
  }
}
