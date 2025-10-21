import 'package:nectar/data/models/product.dart';
import 'package:nectar/core/services/products_api.dart';

class ProductsViewModel {
  List<Product> _productsList = [];
  
  List<Product> get productsList => _productsList;

  ProductsApi productsApi = ProductsApi();
  fetchProducts()async {
    _productsList = await productsApi.fetchAllProducts();
  }
}

