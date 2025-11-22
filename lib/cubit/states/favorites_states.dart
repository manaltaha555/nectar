import 'package:nectar/data/models/product.dart';

sealed class FavoritesStates {}
class FavoritesLoadingState extends FavoritesStates {}
class FavoritesUpdatedState extends FavoritesStates {
  List<Product> favorites  = <Product>[];
  FavoritesUpdatedState(this.favorites);
}
