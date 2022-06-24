// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'url': instance.url,
    };
