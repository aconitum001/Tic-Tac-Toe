class ChallengeModel {
  final int id;
  final String details;
  final String image;
  final String difficulty;
  final int rounds;
  final int reward;

  const ChallengeModel({
    required this.details,
    required this.image,
    required this.difficulty,
    required this.rounds,
    required this.reward,
    required this.id,
  });
}
