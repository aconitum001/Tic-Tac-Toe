import 'package:tic_tac_toe/core/utils/models/user_model.dart';

class NavigationParams {
  final UserModel player1;
  final UserModel player2;
  final String difficulty;
  final List<String>? selectedSkins;

  NavigationParams({
    required this.player1,
    required this.player2,
    required this.difficulty,
    this.selectedSkins,
  });
}
