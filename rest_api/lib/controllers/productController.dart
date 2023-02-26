import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/models/product.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/services/services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
