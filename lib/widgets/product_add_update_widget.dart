import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/basket_provider.dart';
import '../models/product_model.dart';

class ProductAddUpdateWidget extends StatelessWidget {
  final ProductModel product;

  const ProductAddUpdateWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        basket.item == null
            ? ElevatedButton(
                onPressed: () {
                  basket.addToBasket(product, true);
                },
                child: const Text("Add to Basket"))
            : Row(
                children: [
                  IconButton(
                      onPressed: () => basket.addToBasket(product, false),
                      icon: const Icon(Icons.remove)),
                  Text("${basket.item!.quantity}"),
                  IconButton(
                      onPressed: () => basket.addToBasket(product, true),
                      icon: const Icon(Icons.add))
                ],
              )
      ],
    );
  }
}
