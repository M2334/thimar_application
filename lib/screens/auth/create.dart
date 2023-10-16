import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/design/custom_text_field.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/auth/valadition.dart';

import '../../core/design/custom_text_field.dart';
import 'login/login.dart';

class CreateNewPassward extends StatefulWidget {
  const CreateNewPassward({Key? key}) : super(key: key);

  @override
  State<CreateNewPassward> createState() => _CreateNewPasswardState();
}

class _CreateNewPasswardState extends State<CreateNewPassward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsetsDirectional.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'نسيت كلمة المرور',
                    style: TextStyle(
                        color: Color(0xFF558B2F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'أدخل كلمة المرور الجديدة',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'كلمة المرور ',
                  prefixIcon: const Icon(Icons.lock_open_rounded),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'كلمة المرور ',
                  prefixIcon: const Icon(Icons.lock_open_rounded),
                ),
                CustomButton(
                  text: 'تغير كلمة المرور',
                  onPress: () {
                    navigatorTo(const ValaditionScreen());
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF558B2F)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'لديك حساب بالفعل ؟ ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) {
                                return LoginScreen();
                              }));
                            },
                          text: 'تسجيل الدخول',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
