import 'package:flutter/material.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiycode.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/get_data.dart';
import 'package:thimarr/screens/auth/create.dart';
import 'package:thimarr/screens/auth/register/register.dart';
import 'package:thimarr/screens/auth/splash.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiycode.dart';
import 'package:thimarr/screens/my_orders/view.dart';
import 'package:thimarr/screens/notifications/view.dart';

import 'controller/login_controller.dart';
import 'core/logic/helper_navgat.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // GetData().getData();
    return  MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {return Directionality(textDirection: TextDirection.rtl,
         child: child!,);},

      home: const SplashScreen(),
    );
  }
}
