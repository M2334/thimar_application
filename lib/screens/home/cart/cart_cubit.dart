import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/home/cart/cart_states.dart';
import 'package:thimarr/screens/home/cart/mdel.dart';
class CartCubit extends Cubit<CartStates>{
  CartCubit():super(CartStates());
  Future<void> addToCart()async {}
// كدا لجيب اللستا اللى فى الجيسون واحولها عندى لى ليست
  List<CartData> carts=[];

  Future getAllCarts() async {
    emit(LoadingCartState());
try{
  var response=await Dio().get('https://thimar.amr.aait-d.com/api/client/cart',options: Options(headers: {
    'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL3ZlcmlmeSIsImlhdCI6MTY5ODc1ODU3NSwiZXhwIjoxNzMwMjk0NTc1LCJuYmYiOjE2OTg3NTg1NzUsImp0aSI6Ilg5a1dyUkw1VGJ4U1FpdFQiLCJzdWIiOjExODgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.dKqcqWde1goRGNwcMa1h2iMofTuR99eq7Yd5_1M3NmQ'
  }));

  List data=response.data['data'];

  carts=data.map((e) => CartData.fromJson(e)).toList();



  print(carts);
  emit(SuccessCartState(carts));
}on DioException catch(e){
  emit(FailedCartState());
}
  }
}