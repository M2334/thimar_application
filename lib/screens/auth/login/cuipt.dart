
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/auth/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());
  // ده علشان يعرف يقرا القيمة من اليوزر بيدخلخها
  final phoneController = TextEditingController(text: "96655001122334455");
  final passwordController = TextEditingController(text: "123456789");
  Future<void> login() async {
    print(phoneController.text);
    emit(LoginLoadingState());
    print('------------------------------------------------------------');

    try {
      var response =
          await Dio().post("https://thimar.amr.aait-d.com/api/login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "device_token": "test",
        "type": 'ios',
        "user_type": "client",
      });
      emit(LoginSuccessState());
      print(response.data);
    } on DioException catch (e) {
      print(e.toString());
      emit(LoginFailedState());
    }
  }
}
