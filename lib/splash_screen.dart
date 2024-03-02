import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/gen/assets.gen.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Get.offAllNamed(
      "/rowColumnSelectorScreen",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          Assets.animation.logo,
        ),
      ),
    );
  }
}
