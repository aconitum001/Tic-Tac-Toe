import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/colors.dart';

Color getXColor({required String xSkin}) {
  print(xSkin);
  if (xSkin == AppAssets.xStyle1) {
    return AppColors.xColor1;
  } else if (xSkin == AppAssets.xStyle2) {
    return AppColors.xColor2;
  } else if (xSkin == AppAssets.xStyle3) {
    return AppColors.xColor3;
  } else if (xSkin == AppAssets.xStyle4) {
    return AppColors.xColor4;
  } else if (xSkin == AppAssets.xStyle5) {
    return AppColors.xColor5;
  } else if (xSkin == AppAssets.xStyle6) {
    return AppColors.xColor6;
  } else if (xSkin == AppAssets.xStyle7) {
    return AppColors.xColor7;
  } else {
    return AppColors.xColor8;
  }
}
