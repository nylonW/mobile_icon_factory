import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static final Map<int, Color> _primary = {
    50: const Color.fromRGBO(0, 122, 255, .1),
    100: const Color.fromRGBO(0, 122, 255, .2),
    200: const Color.fromRGBO(0, 122, 255, .3),
    300: const Color.fromRGBO(0, 122, 255, .4),
    400: const Color.fromRGBO(0, 122, 255, .5),
    500: const Color.fromRGBO(0, 122, 255, .6),
    600: const Color.fromRGBO(0, 122, 255, .7),
    700: const Color.fromRGBO(0, 122, 255, .8),
    800: const Color.fromRGBO(0, 122, 255, .9),
    900: const Color.fromRGBO(0, 122, 255, 1),
  };

  static MaterialColor primary = MaterialColor(0xFF007AFF, _primary);

  static final Map<int, Color> _primaryDark = {
    50: const Color.fromRGBO(10, 132, 255, .1),
    100: const Color.fromRGBO(10, 132, 255, .2),
    200: const Color.fromRGBO(10, 132, 255, .3),
    300: const Color.fromRGBO(10, 132, 255, .4),
    400: const Color.fromRGBO(10, 132, 255, .5),
    500: const Color.fromRGBO(10, 132, 255, .6),
    600: const Color.fromRGBO(10, 132, 255, .7),
    700: const Color.fromRGBO(10, 132, 255, .8),
    800: const Color.fromRGBO(10, 132, 255, .9),
    900: const Color.fromRGBO(10, 132, 255, 1),
  };

  static MaterialColor primaryDark = MaterialColor(0xFF007AFF, _primaryDark);
}
