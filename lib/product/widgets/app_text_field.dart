import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onSubmitted;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final bool autofocus;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.send,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      autofocus: autofocus,
      onSubmitted: (_) => onSubmitted?.call(),
    );
  }
}
