import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categorie_model.dart';
import 'home_states.dart';
import 'slider_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeStates());
 static  List<SliderModel> ?sliderData;
  static  List<Data> ?categoriedata;
  Future<void>homeGetData()async{
    emit(HomeLoadingState());
    try{
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/sliders");
      print(response.data);
      List data=response.data['data'];
      // convert Model من شكل مااب الى شكل اوبيجكت عندى تو ليست
       sliderData=data.map((e) => SliderModel.fromJson(e)).toList();
      print('/*//////' + sliderData.toString());
      emit(HomeSuccessState(sliderData!));
    } on DioException catch(e){
      print(e);
      emit(HomeFailedState());
    }

  }
  Future<void>categoireGetData()async{
    emit(CategorieLoadingState());
    print('iiiiiiiiiiiiiiiiiiiiiiiiiii');
    try{
      print('ssssssssssssssssssssssssssssssss');
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/categories");
      List data = response.data['data'];
      categoriedata = data.map((e) => Data.fromJson(e)).toList();
      print(categoriedata);
      print('mmmmmmmmmmmmmmmmmm');
      emit(CategorieSuccessState(categoriedata!));
    }on DioException catch(e){
      print('ffffffffffffffffffffffffffffffffff');
      print(e);
      emit(CategorieFailedState());
    }
  }


}