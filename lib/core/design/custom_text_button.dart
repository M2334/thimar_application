
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.text, required this.onPress,})
      : super(key: key);
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Color(0xFF558B2F)),
      ),
    );
  }
}
