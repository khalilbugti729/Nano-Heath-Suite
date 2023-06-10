// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nano_health_suite/models/product_model.dart';
import 'package:nano_health_suite/utils/constants/constants.dart';

class ApiHelper {
  static String BASE_URL = "https://fakestoreapi.com";
  Future<List<ProductModel>> getProductsList() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$BASE_URL/products"),
      );

      List<dynamic> data = json.decode(response.body);
      List<ProductModel> productModelList =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return productModelList;
    } catch (e) {
      showMessage(e.toString());

      return [];
    }
  }

  Future<ProductModel?> getSingleProduct(String id) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$BASE_URL/products/$id"),
      );

      Map<String, dynamic> data = json.decode(response.body);
      ProductModel productModel = ProductModel.fromJson(data);
      return productModel;
    } catch (e) {
      showMessage(e.toString());

      return null;
    }
  }
}
