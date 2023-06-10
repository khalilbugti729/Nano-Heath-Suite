import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite/data/icons_data.dart';
import 'package:nano_health_suite/presentation/widgets/app_btn/app_text_button.dart';
import 'package:nano_health_suite/utils/media_quary/size_config.dart';
import 'package:provider/provider.dart';

import '../../../../config/helpers/input_controller/input_controller.dart';
import '../../../../config/routes/app_route.dart';
import '../../../../config/theme/app_style.dart';
import '../../../provider/app_provider.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../widgets/app_btn/primary_button.dart';
import '../../../widgets/input_field/input_field.dart';
import 'dart:io';

import '../../bottom_page/bottom_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = context.watch<AppProvider>();

    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: linearGradient,
                ),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(appLogo),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth! * 0.08,
                          ),
                          child: Text(
                            "Log In",
                            style: AppStyle.headlineMedium(context)!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Platform.isIOS
                              ? SizeConfig.screenHeight! * 0.01
                              : SizeConfig.screenHeight! * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF4F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    InputField(
                      controller: AuthController().loginEmailController,
                      label: "Email",
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    PassWordInput(
                      controller: AuthController().loginPassController,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    appProvider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : PrimaryButton(
                            buttonTitle: "Continue",
                            onPressed: () async {
                              AppRoutes.pushAndRemoveUntil(
                                context,
                                const BottomBarPage(),
                              );
                            },
                          ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    AppTextButton(
                      btnTitle: "Need Help",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
