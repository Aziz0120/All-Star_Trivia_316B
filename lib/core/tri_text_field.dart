import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:flutter/material.dart';

class TriTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? icon;
  final Widget? prefIcon;

  const TriTextField({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.textInputType,
    this.controller,
    this.onChanged,
    this.icon,
    this.prefIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: TriColors.tiffany,
      cursorHeight: 12,
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLine,
      style: const TextStyle(color: TriColors.tiffany),
      decoration: InputDecoration(
        filled: true,
        fillColor: TriColors.bgCont,
        suffixIcon: icon,
        prefixIcon: prefIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: TriColors.tiffany.withOpacity(0.6),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: TriColors.bgCont,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: TriColors.bgCont,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: TriColors.bgCont,
          ),
        ),
      ),
    );
  }
}
