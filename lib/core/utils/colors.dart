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

  LinearGradient linearColors(Color color1, Color color2) {
    return LinearGradient(
      colors: [
        color1,
        color2,
      ],
      begin: Alignment.center,
      end: Alignment.centerLeft,
    );
  }
}
