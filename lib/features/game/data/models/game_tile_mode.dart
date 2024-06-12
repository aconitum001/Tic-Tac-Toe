class GameTileModel {
  String userName;
  bool isChecked;
  String image;

  GameTileModel({
    required this.userName,
    required this.image,
    required this.isChecked,
  });

  @override
  String toString() {
    return 'GameTileModel{isChecked: $isChecked}';
  }
}
