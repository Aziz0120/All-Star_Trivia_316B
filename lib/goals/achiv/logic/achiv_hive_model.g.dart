// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achiv_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AchivHiveModelAdapter extends TypeAdapter<AchivHiveModel> {
  @override
  final int typeId = 0;

  @override
  AchivHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AchivHiveModel(
      id: fields[0] as int,
      image: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AchivHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchivHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
