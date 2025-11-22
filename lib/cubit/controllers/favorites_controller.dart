import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/core/services/hive_services.dart';
import 'package:nectar/cubit/states/favorites_states.dart';
import 'package:nectar/data/models/product.dart';

//*i do't need state here because  i only have set of favorites
///*so it should be empty set at the begining

class FavoritesController extends Cubit<FavoritesStates> {
  FavoritesController() : super(FavoritesUpdatedState(<Product>[]));

  final String _boxName = 'favoritesBox';

  Future<void> loadFavorites() async {
    emit(FavoritesLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    final favorites = await HiveService.instance.get<List<Product>>(
      _boxName,
      'favorites',
    );
    emit(FavoritesUpdatedState(favorites as List<Product>));
  }

  Future<void> toggleFavorite(Product product) async {
    final currentFavorites = List<Product>.from(
      (state as FavoritesUpdatedState).favorites,
    );
    if (currentFavorites.contains(product)) {
      currentFavorites.remove(product);
    } else {
      currentFavorites.add(product);
    }
    emit(FavoritesUpdatedState(currentFavorites));
    //*update in hive
    await HiveService.instance.put<List<Product>>(
      _boxName,
      'favorites',
      currentFavorites,
    );
  }

  bool isFavorite(Product product) {
    if (state is FavoritesLoadingState) {
      return (state as FavoritesUpdatedState).favorites.contains(product);
    }
    return false;
  }
}
