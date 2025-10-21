import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/data/models/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double actualPrice = double.parse(
      (product.price + (product.price * product.discountPercentage / 100))
          .toStringAsFixed(2),
    );
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(product.images[0], fit: BoxFit.fill),
              ),
              Column(
                children: [
                  Text(product.title, style: theme.textTheme.bodyLarge),
                  Text("${product.weight} pcs, Priceg"),
                ],
              ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${product.price}   ", style: theme.textTheme.bodyLarge),
                      // Text(
                      //   "$actualPrice",
                      //   style: theme.bodyMedium!.copyWith(
                      //     decoration: TextDecoration.lineThrough,
                      //     decorationColor: Color(0XFFA0A0A0),
                      //     decorationThickness: 2,
                      //     color: Color(0XFFA0A0A0),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.add, color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
