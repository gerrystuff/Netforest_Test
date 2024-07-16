import 'package:flutter/material.dart';
import 'package:app/config/app_colors.dart';


class ButtonGeneral extends StatelessWidget {
  final VoidCallback onTap;
  final String titleButton;
  final AnimationController buttonController;
  ButtonGeneral({
    super.key,
    required this.buttonController,
    required this.onTap,
    required this.titleButton,
  })  : buttonSqueezeanimation = Tween(
          begin: 320.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        );

  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 50,
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: buttonSqueezeanimation.value > 75.0
            ? Text( titleButton,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            : SizedBox(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(
                  value: null,
                  strokeWidth: 1.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
