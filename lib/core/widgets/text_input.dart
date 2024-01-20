import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';

class AppTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(dynamic value) validator;
  final TextInputType inputType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final Function(String)? onChanged;

  const AppTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.onChanged
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: AppTypography.inputHint,
          filled: true,
          fillColor: const Color(0xfff1f4ff),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          )
      ),
      keyboardType: widget.inputType,
      validator: widget.validator,
    );
  }
}
