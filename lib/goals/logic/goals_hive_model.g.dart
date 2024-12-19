// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalsHiveModelAdapter extends TypeAdapter<GoalsHiveModel> {
  @override
  final int typeId = 1;

  @override
  GoalsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalsHiveModel(
      id: fields[0] as int,
      image: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GoalsHiveModel obj) {
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
      other is GoalsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
