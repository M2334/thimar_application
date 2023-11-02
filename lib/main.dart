import 'package:flutter/material.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/home/pages/my_account/view.dart';

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
          titleTextStyle: TextStyle( color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {return Directionality(textDirection: TextDirection.rtl,
         child: child!,);},

      // home: const SplashScreen(),
      // home: const HomeScreen(),
      // home: const HomeScreen(),
      // home:  CompleteOrderView(),
      home:  MyAccountPage(),
      // home: const BasketView(),
    );
  }
}
