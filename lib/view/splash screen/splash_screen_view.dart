import 'dart:async';
import 'package:app_controle_estoque/controllers/login_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplasScreenView extends StatefulWidget {
  const SplasScreenView({super.key});

  @override
  State<SplasScreenView> createState() => _SplasScreenViewState();
}

class _SplasScreenViewState extends State<SplasScreenView>
    with SingleTickerProviderStateMixin {
  final loginController = getIt<LoginController>();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initializeSplash();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  void initializeSplash() async {
    Future.delayed(Duration(seconds: 2)).then((value) {
      loginController.checkStateLogin();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
      ),
    );
  }
}
