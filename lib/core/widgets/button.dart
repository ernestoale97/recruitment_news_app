import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/core/resources/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  const AppButton({required this.text, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.blue),
            borderRadius: BorderRadius.circular(18.50),
          ),
          onPressed: onPress,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 20,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: -0.90,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
