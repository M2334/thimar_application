import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;
  final bool isEnabled;
  final TextEditingController controller;
  const CustomTextField(
      {Key? key, required this.labelText, required this.prefixIcon,required this.controller, this.isEnabled = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
       autofocus: true,
      controller: controller,
      enabled: isEnabled,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: prefixIcon,
          labelText: labelText),
    );
  }
}
