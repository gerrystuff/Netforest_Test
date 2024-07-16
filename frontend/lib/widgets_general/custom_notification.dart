import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:app/config/app_colors.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    required this.success,
    required this.message,
    required this.subMessage
  });

  final bool success;
  final String message;
  final String subMessage;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
        decoration: BoxDecoration(
          color: success ? AppColors.greenFive : AppColors.redFive,
          borderRadius: BorderRadius.circular(6),
          border: success ?  Border.all(color: AppColors.greenTwo) :  Border.all(color: AppColors.redPrimary),
        ),
        child: Row(
          children:  [
            Icon(
              Icons.info,
              color:    success ? AppColors.greenTwo : AppColors.redPrimary,
              size: 30,
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subMessage,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
