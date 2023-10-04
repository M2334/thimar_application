import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thimarr/core/design/custom_rich_text.dart';
import 'package:thimarr/core/design/custom_text_button.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/auth/change_phone_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimarr/screens/auth/create.dart';
import 'package:thimarr/screens/auth/login/login.dart';

import '../../core/design/custom_button.dart';

class ValaditionScreen extends StatefulWidget {
  const ValaditionScreen({Key? key}) : super(key: key);
  @override
  State<ValaditionScreen> createState() => _ValaditionScreenState();
}

class _ValaditionScreenState extends State<ValaditionScreen> {
  TextEditingController controller = TextEditingController();
  final CountDownController _controller = CountDownController();
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
                  height: 6,
                ),
                TextButton(
                  onPressed: () {
                    navigatorTo(const CreateNewPassward());
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),

                CustomRichText(text1: 'أدخل الكودالمكون من 4 أرقام المرسل على رقم الجوال+9660548745',
                    color: Colors.grey,
                    text2: 'تغير رقم الجوال',
                    onTap: () {

                }


                ,),
                // RichText(
                //   text: TextSpan(
                //     text: 'أدخل الكودالمكون من 4 أرقام المرسل على رقم الجوال+9660548745 ',
                //     style: const TextStyle(
                //       fontSize: 16,
                //       color: Colors.grey
                //         ),
                //     children: <TextSpan>[
                //       TextSpan(
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               Navigator.push(context,
                //                   MaterialPageRoute(builder: (c) {
                //                     return const ChangePhoneScreen();
                //                   }));
                //             },
                //           text: 'تغير رقم الجوال',
                //           style: const TextStyle(
                //               fontWeight: FontWeight.bold, color: Colors.green)),
                //     ],
                //   ),
                // ),


                // const Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     'أدخل الكودالمكون من 4 أرقام المرسل على رقم الجوال+9660548745',
                //     style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // CustomTextButton(
                //   text: 'تغير رقم الجوال',
                //   onPress: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (c) {
                //       return const ChangePhoneScreen();
                //     }));
                //   },
                // ),




                // TextButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (c) {
                //         return const ChangePhoneScreen();
                //       }));
                //     },
                //     child: const Text(
                //       'تغير رقم الجوال',
                //       style: TextStyle(fontSize: 16, color: Color(0xFF558B2F)),
                //     )),
                const SizedBox(
                  height: 40,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: controller,
                  cursorHeight: 20,
                  enableActiveFill: true,
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 50,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.lightBlue,
                    activeFillColor: Colors.blue,
                    selectedFillColor: Colors.blue,
                    inactiveFillColor: Colors.grey.shade100,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onChanged: ((value) {
                    print(value);
                  }),
                ),
                CustomButton(
                  text: 'تأكيد الكود',
                  onPress: () {},
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF558B2F)),
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsetsDirectional.all(25),
                //   child: ElevatedButton(
                //       style: const ButtonStyle(
                //         backgroundColor:
                //             MaterialStatePropertyAll(Color(0xFF558B2F)),
                //       ),
                //       onPressed: () {},
                //       child: const Text(
                //         'تأكيد الكود ',
                //         style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                //       )),
                // ),
                const Text(
                  'لم تستلم الكود؟ ',
                  style: TextStyle(fontFamily: 'Tajawal', fontSize: 16),
                ),
                const Text(
                  'يمكنك إعادة إرسال الكود بعد ',
                  style: TextStyle(fontFamily: 'Tajawal', fontSize: 16),
                ),
                CircularCountDownTimer(
                  width: 60,
                  height: 60,
                  duration: 120,
                  fillColor: Colors.green,
                  ringColor: Colors.green,
                  strokeWidth: 2.0,
                  strokeCap: StrokeCap.round,
                  controller: _controller,
                  isTimerTextShown: true,
                  textStyle: const TextStyle(fontSize: 20, color: Colors.green),
                  // onComplete: (){
                  //    Alert(
                  //      context:context,
                  //      title:'done',
                  //    ).show();
                  // },
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'إعادة الإرسال',
                        style: TextStyle(
                            fontSize: 16, color: Colors.green, fontFamily: 'Tajawal'),
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                // const Text(
                //   'لديك حساب بالفعل ؟',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontFamily: 'Tajawal',
                //       fontSize: 16,
                //       color: Colors.green),
                // ),

                CustomRichText(text1: 'لديك حساب بالفعل ؟',
                    color: Colors.green,
                    text2: 'تسجيل الدخول ',
                    onTap: () {
                  navigatorTo(LoginScreen());
                },),
                // RichText(
                //   text: TextSpan(
                //     text: 'لديك حساب بالفعل ؟ ',
                //     style: const TextStyle(
                //         fontWeight: FontWeight.bold, color: Colors.green),
                //     children: <TextSpan>[
                //       TextSpan(
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               Navigator.push(context,
                //                   MaterialPageRoute(builder: (c) {
                //                     return const LoginScreen();
                //                   }));
                //             },
                //           text: 'تسجيل الدخول',
                //           style: const TextStyle(
                //               fontWeight: FontWeight.bold, color: Colors.green)),
                //     ],
                //   ),
                // ),


                // CustomTextButton(
                //   text: ' تسجيل الدخول',
                //   onPress: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (c) {
                //       return const LoginScreen();
                //     }));
                //   },
                // ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (c) {
                //       return const LoginScreen();
                //     }));
                //   },
                //   child: const Text('لديك حساب بالفعل ؟ تسجيل الدخول',
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16,
                //           color: Colors.green,
                //           fontFamily: 'Tajawal')),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
