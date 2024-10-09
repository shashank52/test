// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_saved_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsSavedModelAdapter extends TypeAdapter<NewsSavedModel> {
  @override
  final int typeId = 1;

  @override
  NewsSavedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsSavedModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsSavedModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.newsModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsSavedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
