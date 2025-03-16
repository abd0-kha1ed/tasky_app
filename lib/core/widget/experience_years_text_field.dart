import 'package:flutter/material.dart';

class ExperienceYearsTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function()? onTapSuffixIcon;
  final void Function(int)? onChanged; // تغيير نوع onChanged إلى int

  const ExperienceYearsTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.number, // يجب أن يكون رقميًا
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onTapSuffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: (value) {
        final intValue = int.tryParse(value); // تحويل النص إلى عدد صحيح
        if (intValue != null && onChanged != null) {
          onChanged!(intValue);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              )
            : null,
      ),
    );
  }
}
