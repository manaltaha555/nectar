import 'package:nectar/data/models/product.dart';

class Products {
final List<dynamic> productsList;

Products({required this.productsList});

factory Products.fromJson(Map <String, dynamic> jsonData){
  return Products(productsList: jsonData['products']);
}
}
