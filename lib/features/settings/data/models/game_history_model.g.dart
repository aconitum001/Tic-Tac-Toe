// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameHistoryModelAdapter extends TypeAdapter<GameHistoryModel> {
  @override
  final int typeId = 2;

  @override
  GameHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameHistoryModel(
      player1Avatar: fields[0] as String,
      player1UserName: fields[1] as String,
      player1Skin: fields[2] as String,
      player1Score: fields[3] as int,
      player2Avatar: fields[4] as String,
      player2UserName: fields[5] as String,
      player2Skin: fields[6] as String,
      player2Score: fields[7] as int,
      day: fields[8] as String,
      month: fields[9] as String,
      year: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GameHistoryModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.player1Avatar)
      ..writeByte(1)
      ..write(obj.player1UserName)
      ..writeByte(2)
      ..write(obj.player1Skin)
      ..writeByte(3)
      ..write(obj.player1Score)
      ..writeByte(4)
      ..write(obj.player2Avatar)
      ..writeByte(5)
      ..write(obj.player2UserName)
      ..writeByte(6)
      ..write(obj.player2Skin)
      ..writeByte(7)
      ..write(obj.player2Score)
      ..writeByte(8)
      ..write(obj.day)
      ..writeByte(9)
      ..write(obj.month)
      ..writeByte(10)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
