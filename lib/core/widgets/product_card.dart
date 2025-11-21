import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/data/models/product.dart';
import 'package:nectar/features/product_info/product_info.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    double actualPrice = double.parse(
      (product.price + (product.price * product.discountPercentage / 100))
          .toStringAsFixed(2),
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductInfo(product: product),
          ),
        );
      },
      child: SizedBox(
        width: screenWidth * 0.55,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(product.images[0], fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: theme.textTheme.bodyLarge),
                    Text("${product.weight} pcs, Priceg"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "\$${product.price}   ",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              "\$$actualPrice",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0XFFA0A0A0),
                                decorationThickness: 2,
                                color: Color(0XFFA0A0A0),
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
