import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:rest_api/models/product.dart';
import 'package:rest_api/controllers/productController.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    } else {
      //show error message
      print("Error Fetching data");
    }
    return null;
  }
}
