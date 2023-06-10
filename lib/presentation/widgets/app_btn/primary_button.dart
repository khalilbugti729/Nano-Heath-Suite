import 'package:flutter/material.dart';
import 'package:nano_health_suite/utils/media_quary/size_config.dart';

import '../../../utils/constants/app_colors.dart';
import '../text_widget/large_text.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonTitle;

  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.screenWidth! - 20,
      height: SizeConfig.screenHeight! * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: onPressed,
        child: LargeText(
          largeTitle: buttonTitle,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
