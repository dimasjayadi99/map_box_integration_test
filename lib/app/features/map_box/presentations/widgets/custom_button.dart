import 'package:flutter/material.dart';
import '../../../../core/common/constants/app_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const CustomButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppStyle.thirdColor,
              width: 1,
            )),
        child: Icon(
          icon,
          color: AppStyle.secondaryColor,
        ),
      ),
    );
  }
}
