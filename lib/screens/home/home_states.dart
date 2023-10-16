import 'package:thimarr/screens/home/product_categoire_model.dart';

import 'categorie_model.dart';
import 'slider_model.dart';

class HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSuccessState extends HomeStates{
  List<SliderModel> sliderdata;
  HomeSuccessState(this.sliderdata);
}
class HomeFailedState extends HomeStates{}

class CategorieLoadingState extends HomeStates{}
class CategorieSuccessState extends HomeStates{
  List<Data> categoriedata;
  CategorieSuccessState(this.categoriedata);
}
class CategorieFailedState extends HomeStates{}



// categoirse get product data states
class CategoireProductLoadingState extends HomeStates{}
class CategoireProductSuccessState extends HomeStates{
  List<DataModel> ?productData;
  CategoireProductSuccessState(this.productData);
}
class CategoireProductFailedState extends HomeStates{}