import 'package:dio/dio.dart';

class RegisterController{
  Future<void> sendDataRegister(name,password,myPhone,gender,passwordConfirm,lat,lng,cityId,countryId)async{
    var response = await Dio().post("https://thimar.amr.aait-d.com/api/client_register",data: {
      "fullname":name ,
      "password":password,
      "phone":myPhone,
      "gender":gender,
      "password_confirmation":passwordConfirm,
      "lat":lat,
      "lng":lng,
      "city_id":cityId,
      "country_id":countryId,
    }).then((value) => print(value.toString()));
  }
}