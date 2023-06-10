import 'package:flutter/material.dart';
import 'package:nano_health_suite/utils/constants/app_colors.dart';

class DecorationConstants {
  static BoxDecoration myDecoration = BoxDecoration(
    color: kWhiteColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 8,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
