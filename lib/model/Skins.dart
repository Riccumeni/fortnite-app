import 'Skin.dart';

class Skins{
  final int status;
  final List<Skin> data;

  Skins({required this.status, required this.data});

  factory Skins.fromJson(Map<String, dynamic> json){
    List<Skin> skins = [];
    for(int i = 0; i < json["data"].length; i++){
      skins.add(Skin.fromJson(json["data"][i]));
    }
    return Skins(status: json["status"], data: skins);
  }
}