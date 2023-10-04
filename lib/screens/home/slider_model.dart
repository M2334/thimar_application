
class SliderModel {
  late final int id;
  late final String media;

  SliderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    media = json['media'];
  }
}



