import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiy_states.dart';
import 'package:thimarr/screens/auth/verfiycode/verfiy_states.dart';

class VerfiyCubit extends Cubit<VerfiyStates>{
  VerfiyCubit() : super(VerfiyStates());
  // read value from user
  final phoneNumber = TextEditingController();
  Future<void> verfiySendData()async{
    emit(VerfiyLoadingState());
    try{
      final response = await Dio().post("https://thimar.amr.aait-d.com/api/verify",data: {
        "phone":phoneNumber.text,
        "code":"1111",
        "device_token":"test",
        "type":"ios",
      });
      emit(VerfiySuccessState(response.data['status']));
      print(response.data);
    } on DioException catch(e){
      print(e);
      emit(VerfiyFailedState('fail'));
    }
  }
}