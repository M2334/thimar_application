import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/design/custom_rich_text.dart';
import 'package:thimarr/core/design/custom_text_button.dart';
import 'package:thimarr/core/design/custom_text_field.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/auth/valadition.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiy_cubit.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiy_states.dart';

class VerfiycodeScreen extends StatefulWidget {
  const VerfiycodeScreen({Key? key}) : super(key: key);

  @override
  State<VerfiycodeScreen> createState() => _VerfiycodeScreenState();
}

class _VerfiycodeScreenState extends State<VerfiycodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerfiyCubit(),
      child: BlocConsumer<VerfiyCubit, VerfiyStates>(
        listener: (context, state) {
          state is VerfiySuccessState
              ? ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.status)))
              : null;
          state is VerfiyFailedState
              ? ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.status)))
              : null;
        },
        builder: (context, state) {
          return Builder(builder: (context) {
            VerfiyCubit cubit = BlocProvider.of(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage('assets/images/logo.png')),
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
                            'أدخل رقم الجوال المرتبط بحسابك',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: const Image(
                                  image: AssetImage('assets/images/3.png')),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: CustomTextField(
                              controller: cubit.phoneNumber,
                              labelText: 'رقم الجوال',
                              prefixIcon: const Icon(Icons.phone_enabled),
                            )),
                          ],
                        ),
                        CustomButton(
                          text: 'تأكيد رقم الجوال',
                          onPress: () {
                            cubit.verfiySendData();
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF558B2F)),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomRichText(
                          text1: 'لديك حساب بالفعل؟',
                          text2: 'تسجيل الدخول',
                          onTap: () {
                            navigatorTo(const ValaditionScreen());
                          },
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
