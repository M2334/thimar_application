import 'package:flutter/material.dart';
import 'package:thimarr/screens/auth/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
  Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (c){return LoginScreen();})));
    // TODO: implement initState
    super.initState();
  }
  Widget build( BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
      child: const Center(child: Image(image: AssetImage('assets/images/1.png'),)),
    );
  }
}
