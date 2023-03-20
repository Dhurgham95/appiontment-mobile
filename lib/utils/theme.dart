import 'package:flutter/material.dart';

class ThemeApp {
  final List<Color> _colors = [
    // Color(0xFFFF6363),
    // Color(0xFFF89999),
    const Color(0xff52688F),
    const Color(0xff7391C8),
    // Color.fromARGB(255, 55, 129, 156),
    // Color.fromARGB(255, 139, 170, 187),
  ];

  static const _durations = [
    8000,
    7000,
  ];

  static const _heightPercentages = [
    0.3,
    0.35,
  ];

  List<Color> get colors {
    return _colors;
  }

  List<int> get durations {
    return _durations;
  }

  List<double> get heightPercentages {
    return _heightPercentages;
  }
}
