import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/design/custom_rich_text.dart';
import 'package:thimarr/core/design/custom_text_button.dart';
import 'package:thimarr/core/design/custom_text_field.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/auth/login/cuipt.dart';
import 'package:thimarr/screens/auth/login/states.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiycode.dart';
import 'package:thimarr/screens/auth/register/register.dart';
import '../../home/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
          // كد ببنى البلوك وهو جوجود بالفعل فوق بس كسوووول لازم تنادى غليه
          builder: (context) {
        // كده بقى معايا متغير متشاف داخل الديزاين كلو
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
              padding: const EdgeInsetsDirectional.all(10),
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/logo.png')),
                  const SizedBox(
                    height: 3,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'مرحبا بك مرة أخرى',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text('يمكنك تسجيل الدخول الآ ن',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                        ),
                        textAlign: TextAlign.start),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(2),
                        child: const Image(
                            image: AssetImage('assets/images/3.png')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextField(
                        controller: cubit.phoneController,
                        labelText: 'رقم الجوال',
                        prefixIcon: const Icon(Icons.phone_enabled),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: cubit.passwordController,
                    labelText: 'كلمة المرور',
                    prefixIcon: const Icon(Icons.lock_open_sharp),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 200),
                    child: CustomTextButton(
                      text: 'نسيت كلمة المرور؟',
                      onPress: () {
                        navigatorTo(const VerfiycodeScreen());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // custom button widget shared on screen
                  BlocConsumer(
                    bloc: cubit,
                    builder: (BuildContext context, Object? state) {
                      return state is LoginLoadingState
                          ? const CircularProgressIndicator()
                          : state is LoginFailedState
                              ? const Text('Fail')
                              : CustomButton(
                                  text: 'تسجيل الدخول',
                                  onPress: () async {
                                    cubit.login();
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xFF558B2F)),
                                  ),
                                );
                    },
                    listener: (BuildContext context, Object? state) {
                      if (state is LoginSuccessState) {
                        navigatorTo(const HomeScreen());
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRichText(
                      text1: 'ليس لديك حساب؟',
                      color: Colors.green,
                      text2: 'تسجيل الأن',
                      onTap: () {
                        navigatorTo(const RegisterScreen());
                      }),
                ],
              ),
            )),
          ),
        );
      }),
    );
  }
}
