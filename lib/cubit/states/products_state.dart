sealed class ProductsState {}
class ProductsLoading extends ProductsState {}  
class ProductsLoaded extends ProductsState {
  final List products;
  ProductsLoaded(this.products);
}
class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}