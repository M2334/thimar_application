import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/auth/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(): super (RegisterStates());
  final fullName = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final passwordConfirmation = TextEditingController();
  Future<void> registerData()async{
    emit(RegisterLoadingState());
    final response = await Dio().post("https://thimar.amr.aait-d.com/api/client_register",data: {
      "fullname":fullName.text,
      "password":password.text,
      "phone":phone.text,
      "gender":"female",
      "password_confirmation":passwordConfirmation.text,
    });
    print('------------------------------------------------------------');
    print(response.data);

    emit(RegisterSuccessState(response.data['status']));
  }
}