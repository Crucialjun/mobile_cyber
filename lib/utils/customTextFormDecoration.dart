import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFieldDecoration extends InputDecoration {
  const CustomTextFieldDecoration({required this.hintStringText});

  final String hintStringText;

  @override
  String? get hintText => hintStringText;

  @override
  bool? get filled => true;

  @override
  Color? get fillColor => textFieldBackground;

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: textFieldOutline),
        borderRadius: BorderRadius.circular(8),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: textFieldOutline, width: 4),
        borderRadius: BorderRadius.circular(8),
      );

  @override
  InputBorder? get border => OutlineInputBorder(
        borderSide: const BorderSide(color: textFieldOutline),
        borderRadius: BorderRadius.circular(8),
      );
}
