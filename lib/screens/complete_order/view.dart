import 'package:flutter/material.dart';

import '../../core/logic/helper_navgat.dart';
import '../home/home.dart';
class CompleteOrderView extends StatelessWidget {
  const CompleteOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              "السلة",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C8613)),
            )),
        actions: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffF3F8EE),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF4C8613),
              ),
              onPressed: () {
                navigatorTo(const HomeScreen());
              },
            ),
          )
        ],
        // leading: Icon(Icons.arrow_back_ios,),
      ),
      body: Text("complete order screen"),
    );
  }
}
