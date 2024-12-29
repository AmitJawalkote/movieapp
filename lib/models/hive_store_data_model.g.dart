// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_store_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieSeriesHiveModelAdapter extends TypeAdapter<MovieSeriesHiveModel> {
  @override
  final int typeId = 1;

  @override
  MovieSeriesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieSeriesHiveModel(
      isMovie: fields[0] as bool,
      movieSeriesName: fields[1] as String?,
      image: fields[2] as String?,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieSeriesHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isMovie)
      ..writeByte(1)
      ..write(obj.movieSeriesName)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieSeriesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
