// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactAdapter extends TypeAdapter<Fact> {
  @override
  final int typeId = 0;

  @override
  Fact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fact(
      sId: fields[1] as String?,
      iV: fields[2] as int?,
      text: fields[3] as String?,
      updatedAt: fields[4] as String?,
      deleted: fields[5] as bool?,
      source: fields[6] as String?,
      sentCount: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Fact obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.sId)
      ..writeByte(2)
      ..write(obj.iV)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.deleted)
      ..writeByte(6)
      ..write(obj.source)
      ..writeByte(7)
      ..write(obj.sentCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      sId: json['sId'] as String?,
      iV: json['iV'] as int?,
      text: json['text'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deleted: json['deleted'] as bool?,
      source: json['source'] as String?,
      sentCount: json['sentCount'] as int?,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'sId': instance.sId,
      'iV': instance.iV,
      'text': instance.text,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
      'source': instance.source,
      'sentCount': instance.sentCount,
    };
