// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomLogoImage extends StatelessWidget {
  final String image;
  const CustomLogoImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        image,
        width: MediaQuery.of(context).size.width * 0.35,
      ),
    );
  }
}
