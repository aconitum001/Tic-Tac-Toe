import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/game/data/models/challenge_model.dart';
import 'package:tic_tac_toe/features/settings/data/models/skin_model.dart';

const List<String> avatarsList = [
  AppAssets.avtar1,
  AppAssets.avtar2,
  AppAssets.avtar3,
  AppAssets.avtar4,
  AppAssets.avtar5,
  AppAssets.avtar6,
  AppAssets.avtar7,
  AppAssets.avtar8,
];

const xLists = [
  AppAssets.xStyle1,
  AppAssets.xStyle2,
  AppAssets.xStyle3,
  AppAssets.xStyle4,
  AppAssets.xStyle5,
  AppAssets.xStyle6,
  AppAssets.xStyle7,
  AppAssets.xStyle8,
];

const oLists = [
  AppAssets.oStyle1,
  AppAssets.oStyle2,
  AppAssets.oStyle3,
  AppAssets.oStyle4,
  AppAssets.oStyle5,
  AppAssets.oStyle6,
  AppAssets.oStyle7,
  AppAssets.oStyle8,
];

const List<SkinModel> skinsList = [
  SkinModel(xSkin: AppAssets.xStyle1, oSkin: AppAssets.oStyle1, price: 0),
  SkinModel(xSkin: AppAssets.xStyle2, oSkin: AppAssets.oStyle2, price: 100),
  SkinModel(xSkin: AppAssets.xStyle3, oSkin: AppAssets.oStyle3, price: 200),
  SkinModel(xSkin: AppAssets.xStyle4, oSkin: AppAssets.oStyle4, price: 300),
  SkinModel(xSkin: AppAssets.xStyle5, oSkin: AppAssets.oStyle5, price: 400),
  SkinModel(xSkin: AppAssets.xStyle6, oSkin: AppAssets.oStyle6, price: 500),
  SkinModel(xSkin: AppAssets.xStyle7, oSkin: AppAssets.oStyle7, price: 600),
  SkinModel(xSkin: AppAssets.xStyle8, oSkin: AppAssets.oStyle8, price: 700),
];

const List<ChallengeModel> challengesList = [
  ChallengeModel(
    id: 0,
    details: "win 5 games",
    image: AppAssets.round5,
    difficulty: "0.5",
    rounds: 5,
    reward: 50,
  ),
  ChallengeModel(
    id: 1,
    details: "win 10 games",
    image: AppAssets.round10,
    difficulty: "0.4",
    rounds: 10,
    reward: 100,
  ),
  ChallengeModel(
    id: 2,
    details: "win 15 games",
    image: AppAssets.round15,
    difficulty: "0.3",
    rounds: 15,
    reward: 200,
  ),
  ChallengeModel(
    id: 3,
    details: "win 20 games",
    image: AppAssets.round15,
    difficulty: "0.3",
    rounds: 20,
    reward: 300,
  ),
  ChallengeModel(
    id: 4,
    details: "win 25 games",
    image: AppAssets.round15,
    difficulty: "0.2",
    rounds: 25,
    reward: 400,
  ),
  ChallengeModel(
    id: 5,
    details: "win 30 games",
    image: AppAssets.round15,
    difficulty: "0.2",
    rounds: 30,
    reward: 500,
  ),
  ChallengeModel(
    id: 6,
    details: "win 35 games",
    image: AppAssets.round15,
    difficulty: "0.15",
    rounds: 35,
    reward: 600,
  ),
  ChallengeModel(
    id: 7,
    details: "win 40 games",
    image: AppAssets.round15,
    difficulty: "0.1",
    rounds: 40,
    reward: 700,
  ),
];

const String kUserBox = "usersBox";
const String kHistoryBox = "historyBox";

const int winPointsEasy = 30;
const int winPointsMedium = 4;
const int winPointsHard = 6;

const int losePointsEasy = -1;
const int losePointsMedium = -2;
const int losePointsHard = -3;
