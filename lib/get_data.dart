
import 'package:dio/dio.dart';
class GetData{

  Future getData()async{
    String api = 'https://jsonplaceholder.typicode.com/todos/5https://newsapi.org/v2/everything?q=tesla&from=2023-07-15&sortBy=publishedAt&apiKey=34494de921614caa8966938e5cc94167';
    var response =await Dio().get(api);
    List names=[];
    List list=[];

    print(response.data['articles'][10]['source']['name']);
  }
}