import 'package:flutter/material.dart';
class CustomTextButtonOrder extends StatelessWidget {
   CustomTextButtonOrder({Key? key,   this.text,  required this.onPress ,required this.image}) : super(key: key);
  final String image;
  final Function onPress;
  String ? text ; // optinal parameter
  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: (){
      onPress;
    }, child: Row(
      children: [
        Image.asset(image),
        if(text != null)
        Text(text!),
      ],
    ),
    );
  }
}
