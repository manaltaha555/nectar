import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/cubit/states/products_state.dart';
import 'package:nectar/core/services/products_service.dart';

class ProductsController extends Cubit<ProductsState> {
  final ProductsApi _productsApi = ProductsApi();
  ProductsController() : super(ProductsLoading());

  Future<void> fetchAllProducts() async {
    try {
      emit(ProductsLoading());
      await Future.delayed(const Duration(seconds: 2)); 
      final products = await _productsApi.fetchAllProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
