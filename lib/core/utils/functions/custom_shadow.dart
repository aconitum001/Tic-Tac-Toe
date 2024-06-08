import 'package:flutter/material.dart';

Decoration buildShadow(context, Color color, double raduis) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(raduis),
    boxShadow: [
      BoxShadow(
        blurRadius: 4,
        spreadRadius: 0,
        offset: const Offset(0, 4),
        color: color,
      ),
    ],
  );
}
