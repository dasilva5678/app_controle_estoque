import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomIsLoading extends StatelessWidget {
  final String message;
  const CustomIsLoading({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCircle(
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.07,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
