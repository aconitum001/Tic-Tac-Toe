class GameTileModel {
  final String userName;
  final bool isChecked;
  final String image;

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
