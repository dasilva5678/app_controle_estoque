// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_controle_estoque/core/utils/app_colors.dart';

class CustomTextForm extends StatefulWidget {
  final int? maxLines;
  final double borderRadius;
  final double inputHeight;
  final String? label;
  final String? hintText;
  final String? title;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextForm({
    Key? key,
    this.maxLines = 1,
    this.borderRadius = 10,
    this.inputHeight = 33,
    this.label,
    this.hintText,
    this.title,
    this.validator,
    this.autoFocus = false,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.contentPadding = const EdgeInsets.fromLTRB(10.0, 10, 10.0, 10),
  }) : super(key: key);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  // late FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: widget.inputHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
        child: TextFormField(
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 17,
          ),
          autofocus: widget.autoFocus,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          cursorColor: AppColors.blue,
          decoration: InputDecoration(
            prefixIcon: widget.suffixIcon,
            suffixIcon: widget.prefixIcon,
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            labelText: widget.label,
            labelStyle: TextStyle(
              color: AppColors.blue,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            contentPadding: widget.contentPadding,
          ),
        ),
      ),
    );
  }
}
