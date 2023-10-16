import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimarr/screens/home/product_categoire_model.dart';

import 'categorie_model.dart';
import 'home_states.dart';
import 'slider_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeStates());
 static  List<SliderModel> ?sliderData;
  static  List<Data> ?categoriedata;
  static  List<DataModel> ?productdata;
  List<Data>? get productData => null;
  Future<void>homeGetData()async{
    emit(HomeLoadingState());
    try{
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/sliders");
      print(response.data);
      List data=response.data['data'];
      // convert Model من شكل مااب الى شكل اوبيجكت عندى تو ليست
       sliderData=data.map((e) => SliderModel.fromJson(e)).toList();
       print('/*/*/*/**/*/*/**/*/*/*/*/*/*/');
      print('/*//////' + sliderData.toString());
      print(sliderData![0].media);
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
  Future<void>categoireGetProductData()async{
    emit(CategoireProductLoadingState());
    print('iiiiiiiiiiiiiiiiiiiiiiiiiii');
    try{
      print('ssssssssssssssssssssssssssssssss');
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/products");
      print(response.data['data']);
      List data = response.data['data'];
      productdata = data.map((e) => DataModel.fromJson(e)).toList();
      print(productdata![0]);
      print('mmmmmmmmmmmmmmmmmm');
      emit(CategoireProductSuccessState(productdata));
    }on DioException catch(e){
      print('ffffffffffffffffffffffffffffffffff');
      print(e);
      emit(CategoireProductFailedState());
    }
  }


}