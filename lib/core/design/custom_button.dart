import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPress, required ButtonStyle style })
      : super(key: key);
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(25),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFF558B2F)),
        ),
        child: Text(text),
      ),
    );
  }
}
