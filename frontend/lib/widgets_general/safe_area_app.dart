import 'package:flutter/material.dart';
import 'package:app/config/app_colors.dart';

class SafeAreaApp extends StatelessWidget {
  const SafeAreaApp({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.white),
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}
