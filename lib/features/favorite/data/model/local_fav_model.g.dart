// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_fav_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalFavModelAdapter extends TypeAdapter<LocalFavModel> {
  @override
  final int typeId = 0;

  @override
  LocalFavModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalFavModel(
      title: fields[0] as String,
      url: fields[1] as String,
      urlToImage: fields[2] as String,
      publishedAt: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalFavModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.urlToImage)
      ..writeByte(3)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFavModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
