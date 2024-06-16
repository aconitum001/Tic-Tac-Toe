import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/colors.dart';

Color getOColor({required String oSkin}) {
  if (oSkin == AppAssets.oStyle1) {
    return AppColors.oColor1;
  } else if (oSkin == AppAssets.oStyle2) {
    return AppColors.oColor2;
  } else if (oSkin == AppAssets.oStyle3) {
    return AppColors.oColor3;
  } else if (oSkin == AppAssets.oStyle4) {
    return AppColors.oColor4;
  } else if (oSkin == AppAssets.oStyle5) {
    return AppColors.oColor5;
  } else if (oSkin == AppAssets.oStyle6) {
    return AppColors.oColor6;
  } else if (oSkin == AppAssets.oStyle7) {
    return AppColors.oColor7;
  } else {
    return AppColors.oColor8;
  }
}
