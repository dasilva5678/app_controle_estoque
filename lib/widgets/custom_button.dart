// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color? colorButton;
  final Color? colorLabel;
  final double height;
  final double width;
  final double borderRadius;
  final Function() onTap;
  CustomButton({
    Key? key,
    required this.label,
    this.colorButton,
    this.colorLabel,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: colorButton!,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.040,
                fontWeight: FontWeight.w700,
                color: colorLabel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
