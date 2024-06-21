// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userName: fields[0] as String,
      avatar: fields[1] as String,
      points: fields[2] as int,
      skinsCollection: (fields[3] as List).cast<String>(),
      challengesFinished: (fields[4] as List).cast<int>(),
      selectedSkin: (fields[5] as List).cast<String>(),
      draws: fields[8] as int,
      wins: fields[6] as int,
      loses: fields[7] as int,
      unlockedSkins: (fields[9] as List).cast<int>(),
      unlockedChallenges: (fields[10] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.points)
      ..writeByte(3)
      ..write(obj.skinsCollection)
      ..writeByte(4)
      ..write(obj.challengesFinished)
      ..writeByte(5)
      ..write(obj.selectedSkin)
      ..writeByte(6)
      ..write(obj.wins)
      ..writeByte(7)
      ..write(obj.loses)
      ..writeByte(8)
      ..write(obj.draws)
      ..writeByte(9)
      ..write(obj.unlockedSkins)
      ..writeByte(10)
      ..write(obj.unlockedChallenges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
