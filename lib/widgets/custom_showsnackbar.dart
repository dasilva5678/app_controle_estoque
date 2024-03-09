import 'package:flutter/material.dart';

SnackBar showSnackBarDialog({
  required String label,
  required String title,
  required IconData icon,
  Color? textColorLabel,
  Color? backgroundColor,
  SnackBarAction? action,
}) {
  return SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
    action: action,
    behavior: SnackBarBehavior.floating,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
              ),
              Text(
                label,
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
