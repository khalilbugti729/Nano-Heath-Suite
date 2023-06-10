import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite/config/theme/app_style.dart';
import 'package:nano_health_suite/presentation/widgets/app_btn/primary_button.dart';
import 'package:nano_health_suite/presentation/widgets/text_widget/large_text.dart';
import 'package:nano_health_suite/utils/constants/app_colors.dart';
import 'package:nano_health_suite/utils/media_quary/size_config.dart';

import '../../../data/icons_data.dart';
import '../../widgets/text_widget/middle_text.dart';
import '../../../models/product_model.dart';
import 'dart:io';

class ProductViewPage extends StatelessWidget {
  final ProductModel productView;
  const ProductViewPage({super.key, required this.productView});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.screenHeight! / 1.5,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(productView.image),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kWhiteColor,
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.arrow_back),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhiteColor,
                                ),
                                child: const Center(
                                  child: Icon(Icons.more_vert),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.015,
                          ),
                          const LargeText(
                            largeTitle: "Details",
                            fontFamily: "OpenSansRegular",
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: Platform.isAndroid
                              ? SizeConfig.screenHeight! * 0.08
                              : SizeConfig.screenHeight! * 0.04,
                        ),
                        child: Text(
                          "${productView.price} AED",
                          style: AppStyle.headlineLarge(context)!.copyWith(
                              color: knavybluee, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 19),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.1), // Set the shadow color
                      spreadRadius: 3, // Set the spread radius of the shadow
                      blurRadius: 8, // Set the blur radius of the shadow
                      offset:
                          const Offset(0, 3), // Set the offset of the shadow
                    ),
                  ],
                  color: kWhiteColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: SafeArea(
                    top: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: Container(
                                height: 60,
                                width: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(107, 127, 153, 0.25),
                                      blurRadius: 18,
                                      spreadRadius: 4,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: kWhiteColor,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(shareIcon),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.1,
                            ),
                            Expanded(
                              child: PrimaryButton(
                                buttonTitle: "Order Now",
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        const MediumText(
                          middleTitle: "Description",
                          fontFamily: "OpenSans",
                          color: knavybluee,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        MediumText(
                          middleTitle: productView.description,
                          fontFamily: "OpenSansLight",
                          color: knavybluee,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.01,
                        ),
                        Container(
                          height: SizeConfig.screenHeight! * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF1F1F1),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LargeText(
                                largeTitle:
                                    "Reviews ${productView.rating.count}",
                                // fontFamily: "OpenSansRegular",
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    productView.rating.rate.toString(),
                                    style: AppStyle.headlineMedium(context)!
                                        .copyWith(
                                      color: knavybluee,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    // itemSize: ,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    unratedColor: kWhiteColor,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xffFFE072),
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
