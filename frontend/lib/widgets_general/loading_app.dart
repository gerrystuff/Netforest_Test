import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingApp {
  static void show(
    BuildContext context, {
    bool useRootNav = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNav,
      builder: (_) {
        return WillPopScope(
          child: Lottie.asset('assets/loading/loading1.json'),
          onWillPop: () async {
            return false;
          },
        );
      },
    );
  }
}
