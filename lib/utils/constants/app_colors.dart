import 'package:flutter/material.dart';

const kScaffoldColor = Color(0xffF5F5F5);
const Color knavybluee = Color(0xff08293B);
const Color kWhiteColor = Colors.white;
Color kLightWhiteColor = Colors.white.withOpacity(0.5);
const Color kPrimaryColor = Color(0xff2ab3c6);

LinearGradient linearGradient = const LinearGradient(
  colors: [
    Color(0xFF188095),
    Color(0xFF2AB3C6),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

MaterialColor materialprimarycolor = const MaterialColor(
  _materialprimarycolorPrimaryValue,
  <int, Color>{
    50: Color(0xFFE5F6F8),
    100: Color(0xFFBFE8EE),
    200: Color(0xFF95D9E3),
    300: Color(0xFF6ACAD7),
    400: Color(0xFF4ABECF),
    500: Color(_materialprimarycolorPrimaryValue),
    600: Color(0xFF25ACC0),
    700: Color(0xFF1FA3B9),
    800: Color(0xFF199AB1),
    900: Color(0xFF0F8BA4),
  },
);
const int _materialprimarycolorPrimaryValue = 0xFF2AB3C6;

const MaterialColor materialprimarycolorAccent = MaterialColor(
  _materialprimarycolorAccentValue,
  <int, Color>{
    100: Color(0xFFD4F7FF),
    200: Color(_materialprimarycolorAccentValue),
    400: Color(0xFF6EE3FF),
    700: Color(0xFF54DEFF),
  },
);
const int _materialprimarycolorAccentValue = 0xFFA1EDFF;
