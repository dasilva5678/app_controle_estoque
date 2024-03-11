// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  bool isleading;
  String title;
  void Function()? onPressed;
  TabBar? tab;
  CustomAppBar({
    Key? key,
    required this.isleading,
    required this.title,
    this.onPressed,
    this.tab,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade100,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 2,
      leading: widget.isleading == true
          ? IconButton(
              icon: const Icon(Icons.keyboard_return_rounded),
              color: AppColors.darkBlue,
              onPressed: widget.onPressed,
            )
          : Container(),
      title: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.darkBlue,
          ),
        ),
      ),
      bottom: widget.tab != null
          ? PreferredSize(
              preferredSize:
                  Size.fromHeight(48), // Ajuste a altura conforme necessário
              child: widget.tab!,
            )
          : null,
    );
  }
}
