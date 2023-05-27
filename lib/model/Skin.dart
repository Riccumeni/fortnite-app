import 'Images.dart';

class Skin{
  final String id;
  final String name;
  final Images images;

  Skin({required this.id, required this.name, required this.images});

  factory Skin.fromJson(Map<String, dynamic> json){

    return Skin(id: json["id"], name: json["name"], images: Images.fromJson(json["images"]));
  }
}