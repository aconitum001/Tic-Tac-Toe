import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary1 = Color(0xff232C46);
  static const Color primary2 = Color(0xff29324B);
  static const Color primary3 = Color(0xff3F4E6B);

  static const List<Color> secondary1 = [
    Color(0xffA2B0D3),
    Color(0xff8B9ECE),
  ];
  static const Color secondary2 = Color(0xff889BCC);
  static const Color secondary3 = Color(0xffA2B0D3);

  static const Color grey1 = Color(0xff000000);
  static const Color grey2 = Color(0xff1E1E1E);
  static const Color grey3 = Color(0xffFFFFFF);

  static LinearGradient linearColors(List<Color> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.center,
      end: Alignment.centerLeft,
    );
  }

  static const Color oColor1 = Color(0xffFF9C8E);
  static const Color oColor2 = Color(0xffFFEEA9);
  static const Color oColor3 = Color(0xffD1D8C5);
  static const Color oColor4 = Color(0xffAFD198);
  static const Color oColor5 = Color(0xffE1AFD1);
  static const Color oColor6 = Color(0xffFEEFAD);
  static const Color oColor7 = Color(0xffFFFF80);
  static const Color oColor8 = Color(0xff8ACDD7);

  static const Color xColor1 = Color(0xff97CE62);
  static const Color xColor2 = Color(0xffFFBF78);
  static const Color xColor3 = Color(0xff7E8EF1);
  static const Color xColor4 = Color(0xffECCA9C);
  static const Color xColor5 = Color(0xffAD88C6);
  static const Color xColor6 = Color(0xff68D2E8);
  static const Color xColor7 = Color(0xffFF5580);
  static const Color xColor8 = Color(0xffFFC0D9);
}
