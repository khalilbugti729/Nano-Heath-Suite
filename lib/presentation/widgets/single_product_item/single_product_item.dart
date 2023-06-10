import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/product_model.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/media_quary/size_config.dart';
import '../text_widget/large_text.dart';
import '../text_widget/middle_text.dart';
import '../text_widget/small_text.dart';

class SingleProductItem extends StatelessWidget {
  final ProductModel productData;
  const SingleProductItem({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.25,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(productData.image),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.0001),
                        Color.fromRGBO(0, 0, 0, 0.496012),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(
                        largeTitle: "${productData.price} AED",
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                        fontFamily: "OpenSansRegular",
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 25,
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
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          MediumText(
            middleTitle: productData.title,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.normal,
            color: knavybluee,
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          SmallText(
            smallText: productData.description,
            fontFamily: "OpenSansRegular",
            color: knavybluee,
          ),
        ],
      ),
    );
  }
}
