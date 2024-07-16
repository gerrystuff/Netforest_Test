import 'package:flutter/material.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        constraints:  const BoxConstraints(maxWidth: 600,minHeight: double.infinity),
        child: child,
      ),
    );
  }
}
