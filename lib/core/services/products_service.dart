import 'dart:convert';

import 'package:nectar/core/core.dart';
import 'package:nectar/data/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:nectar/data/models/products.dart';

class ProductsApi {
  Future<List<Product>> fetchAllProducts() async {
    http.Response response = await http.get(
      Uri.https( ApiConstants.baseUrl,  ApiConstants.groceriesPath),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Products products = Products.fromJson(data);
      List<Product> productsList = products.productsList
          .map((e) => Product.fromJson(e))
          .toList();
      return productsList;
    } else {
      print(response.statusCode);
      return [];
    }
  }
}
