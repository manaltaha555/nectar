import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/cubit/controllers/favorites_controller.dart';
import 'package:nectar/cubit/states/favorites_states.dart';
import 'package:nectar/data/models/product.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesController, FavoritesStates>(
      builder: (context, state) {
        bool isFavorite = context.read<FavoritesController>().isFavorite(
          product,
        );
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 30,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            context.read<FavoritesController>().toggleFavorite(product);
          },
        );
      },
    );
  }
}
