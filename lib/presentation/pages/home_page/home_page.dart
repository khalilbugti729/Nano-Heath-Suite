import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/config/routes/app_route.dart';
import 'package:nano_health_suite/config/theme/app_style.dart';
import 'package:nano_health_suite/presentation/pages/product_view_page/product_view_page.dart';
import 'package:nano_health_suite/presentation/provider/app_provider.dart';
import 'package:nano_health_suite/utils/media_quary/size_config.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../utils/constants/app_colors.dart';
import '../../widgets/single_product_item/single_product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AppProvider appProvider = Provider.of(context, listen: false);
    appProvider.getProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = context.watch<AppProvider>();

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight! * 0.1,
        elevation: 10,
        shadowColor: kLightWhiteColor,
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text(
          'All Products',
          style: AppStyle.headlineMedium(context)!.copyWith(
            color: knavybluee,
          ),
        ),
      ),
      body: appProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: appProvider.productList.length,
              itemBuilder: (context, index) {
                ProductModel product = appProvider.productList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        AppRoutes.pushToNextPage(
                          context,
                          ProductViewPage(
                            productView: product,
                          ),
                        );
                      },
                      child: SingleProductItem(
                        productData: product,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
