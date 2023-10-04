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