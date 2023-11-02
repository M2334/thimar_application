import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class CustomRichText extends StatelessWidget {
  final String text1,text2;
  final Function onTap;
  final Color? color;

  const CustomRichText({Key? key, required this.text1,  required this.text2, required this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
            fontSize: 16,
            color: color,
        ),
        children: <TextSpan>[
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onTap();
                },
              text: text2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}
