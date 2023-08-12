import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends InputDecoration {
  const CustomTextFieldDecoration({required this.hintStringText, this.endIcon});

  final String hintStringText;
  final Widget? endIcon;

  @override
  String? get hintText => hintStringText;

  @override
  bool? get filled => true;

  @override
  Widget? get suffixIcon => endIcon;

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(8),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderSide: const BorderSide(width: 4),
        borderRadius: BorderRadius.circular(8),
      );

  @override
  InputBorder? get border => OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(8),
      );
}
