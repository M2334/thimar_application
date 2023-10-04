import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/controller/register_controller.dart';
import 'package:thimarr/core/design/custom_button.dart';
import 'package:thimarr/core/design/custom_rich_text.dart';
import 'package:thimarr/core/design/custom_text_field.dart';
import 'package:thimarr/core/logic/helper_navgat.dart';
import 'package:thimarr/screens/auth/activate.dart';
import 'package:thimarr/screens/auth/register/register_cubit.dart';
import 'package:thimarr/screens/auth/register/register_states.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiycode.dart';

import '../../home/home.dart';
import '../../sheets/cities.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedCityText = "";
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var myPhoneController = TextEditingController();
  var genderController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  var latController = TextEditingController();
  var lngController = TextEditingController();
  var cityIdController = TextEditingController();
  var countryIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        RegisterCubit cubit = BlocProvider.of(context);
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
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'مرحبا بك مرة أخرى',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'يمكنك تسجيل حساب جديد الآن',
                        style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: cubit.fullName,
                        labelText: 'اسم المستخدم',
                        prefixIcon: const Icon(Icons.person)),
                    const SizedBox(
                      height: 10,
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     ),
                    //     labelText: 'اسم المستخدم',
                    //     prefixIcon: Icon(Icons.person),
                    //   ),
                    // ),
                    Row(
                      children: [
                        const Image(image: AssetImage('assets/images/3.png')),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomTextField(
                          controller: cubit.phone,
                          labelText: 'رقم الجوال',
                          prefixIcon: const Icon(Icons.phone_enabled),
                        ))
                        // Container(
                        //    child: const TextField(
                        //      decoration: InputDecoration(
                        //        border: OutlineInputBorder(
                        //          borderRadius: BorderRadius.all(Radius.circular(10)),
                        //        ),
                        //        prefixIcon: Icon(Icons.phone_enabled),
                        //        labelText: 'رقم الجوال',
                        //      ),
                        //    ),
                        //  ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GestureDetector(
                      onTap: ()async{
                        var result = await showModalBottomSheet(context: context, builder: (context) =>const CitiesSheets(),);
                        if(result!=null){
                          selectedCityText = result;
                          setState(() {
                          });
                          print("The Result is $selectedCityText");
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: countryIdController,
                              labelText: selectedCityText??' المدينة الحالية',
                              isEnabled: false,
                              prefixIcon: const Icon(Icons.location_city),
                            ),
                          ),
                           if(selectedCityText!=null)
                           Center(child: IconButton(onPressed: (){
                             selectedCityText = null;
                             setState(() {
                             });
                           }, icon: const Icon(Icons.clear,color: Colors.red,))),
                        ],
                      ),
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10))),
                    //     labelText: 'المدينة',
                    //     prefixIcon: Icon(Icons.location_city),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomTextField(
                      controller: cubit.password,
                      labelText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10))),
                    //     labelText: 'كلمة المرور',
                    //     prefixIcon: Icon(Icons.lock_open_rounded),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomTextField(
                      controller: cubit.passwordConfirmation,
                      labelText: 'كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10))),
                    //     labelText: 'كلمة المرور',
                    //     prefixIcon: Icon(Icons.lock_open_rounded),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 2,
                    ),
                    BlocConsumer<RegisterCubit,RegisterStates>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          navigatorTo(const HomeScreen());
                        }
                      },
                      builder: (context, state) {
                        bloc:
                        cubit;
                        return state is RegisterLoadingState
                            ? const CircularProgressIndicator()
                            : state is RegisterFailedState
                                ? const Text("faill")
                                : CustomButton(
                                    text: 'تسجيل',
                                    onPress: () {
                                      cubit.registerData();
                                      RegisterController().sendDataRegister(
                                          nameController.text,
                                          passwordController.text,
                                          myPhoneController.text,
                                          genderController.text,
                                          passwordConfirmController.text,
                                          '',
                                          '',
                                          'cityId',
                                          'countryId');
                                      navigatorTo(const ActiveAcountScreen());
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF558B2F)),
                                    ),
                                  );
                      },
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsetsDirectional.only(start: 25,end: 25),
                    //   child: ElevatedButton(
                    //
                    //       style: const ButtonStyle(
                    //         backgroundColor: MaterialStatePropertyAll(Color(0xFF558B2F)),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (c) {
                    //           return const ActiveAcountScreen();
                    //         }));
                    //       },
                    //       child: const Text(
                    //         'تسجيل ',
                    //         style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                    //       )),
                    // ),

                    CustomRichText(
                      text1: 'لديك حساب بالفعل؟',
                      text2: 'تسجيل الدخول',
                      onTap: () {

                        navigatorTo(const VerfiycodeScreen());
                      },
                      color: Colors.green,
                    ),
                    // CustomTextButton(
                    //     text: 'لديك حساب بالفعل؟ تسجيل الدخول',
                    //     onPress: () {
                    //       Navigator.push(context, MaterialPageRoute(builder: (c) {
                    //         return const VerfiycodeScreen();
                    //       }));
                    //     }
                    //     ),

                    // TextButton(
                    //     onPressed: () {
                    //       Navigator.push(context, MaterialPageRoute(builder: (c) {
                    //         return const VerfiycodeScreen();
                    //       }));
                    //     },
                    //     child: const Text(
                    //       'لديك حساب بالفعل؟ تسجيل الدخول',
                    //       style: TextStyle(fontSize: 16, color: Color(0xFF558B2F)),
                    //     )),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}



