import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'fact.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Fact extends HiveObject {
  @HiveField(1)
  String? sId;
  @HiveField(2)
  int? iV;
  @HiveField(3)
  String? text;
  @HiveField(4)
  String? updatedAt;
  @HiveField(5)
  bool? deleted;
  @HiveField(6)
  String? source;
  @HiveField(7)
  int? sentCount;

  Fact(
      {this.sId,
      this.iV,
      this.text,
      this.updatedAt,
      this.deleted,
      this.source,
      this.sentCount});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
  Map<String, dynamic> toJson() => _$FactToJson(this);
}
