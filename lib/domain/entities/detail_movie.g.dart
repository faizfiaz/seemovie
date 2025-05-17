// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailMovieAdapter extends TypeAdapter<DetailMovie> {
  @override
  final int typeId = 1;

  @override
  DetailMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailMovie(
      id: fields[0] as int?,
      title: fields[1] as String?,
      originalTitle: fields[2] as String?,
      overview: fields[3] as String?,
      tagline: fields[4] as String?,
      releaseDate: fields[5] as DateTime?,
      originalLanguage: fields[6] as String?,
      status: fields[7] as String?,
      backdropPath: fields[8] as String?,
      posterPath: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailMovie obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.originalTitle)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.tagline)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.originalLanguage)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.backdropPath)
      ..writeByte(9)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
