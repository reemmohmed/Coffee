import 'package:coffee_app/core/app_color.dart';
import 'package:coffee_app/core/widgets/titel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.border,
    this.colorIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLines = 1,
    this.fillColor,
    this.filled = true,
    this.colorhintText,
    this.labelText,
  });

  final String? hintText;
  final InputBorder? border;
  final Color? colorIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Color? fillColor;
  final bool filled;
  final Color? colorhintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      style: TextStyle(
        color: colorhintText ?? Colors.white,
        fontSize: size.width * 0.04,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.02,
        ),
        label: TitelTextWidget(
          text: labelText ?? "",
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: size.width * 0.04,
        ),
        prefixIcon:
            prefixIcon ??
            Icon(Ionicons.search, color: colorIcon ?? Colors.white),
        suffixIcon: suffixIcon,
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
        filled: filled,
        fillColor: fillColor ?? Colors.grey.shade800,
      ),
    );
  }
}
