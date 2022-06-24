import 'package:json_annotation/json_annotation.dart';
part 'cat.g.dart';

@JsonSerializable()

class Cat {
  String? id;
  String? createdAt;
  String? url;

  Cat({this.id, this.createdAt, this.url});

   factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}
