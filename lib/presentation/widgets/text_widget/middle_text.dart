import 'package:flutter/material.dart';

import '../../../config/theme/app_style.dart';

class MediumText extends StatelessWidget {
  final String middleTitle;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  const MediumText({
    super.key,
    required this.middleTitle,
    this.fontFamily,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      middleTitle,
      style: AppStyle.titleMedium(context)!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
