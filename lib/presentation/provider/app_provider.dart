// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:nano_health_suite/config/helpers/api_helper.dart';
import 'package:nano_health_suite/models/product_model.dart';

class AppProvider extends ChangeNotifier {
  final ApiHelper _apiHelper = ApiHelper();
  bool _isLoading = false;
  List<ProductModel> _productList = [];
  Future<void> getProductsList() async {
    _isLoading = true;
    _productList = await _apiHelper.getProductsList();
    _isLoading = false;
    notifyListeners();
  }

  Future<ProductModel?> getSingleProducts(String id) async {
    _isLoading = true;
    notifyListeners();
    ProductModel? productModel = await _apiHelper.getSingleProduct(id);
    _isLoading = false;
    notifyListeners();
    return productModel;
  }

  List<ProductModel> get productList => _productList;
  bool get isLoading => _isLoading;
}
