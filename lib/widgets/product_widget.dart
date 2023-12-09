import 'package:flutter/material.dart';
import 'package:greggs_challenge/controllers/basket_controller.dart';
import 'package:greggs_challenge/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget(
      {super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketController>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      // height: MediaQuery.of(context).size.height * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image(
            image: NetworkImage(product.thumbnailUri),
            fit: BoxFit.contain,
          ),
          Text(product.articleName),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("EatIn: \n £${product.eatInPrice} "),
              Text("EatOut: \n £${product.eatOutPrice} "),
              Text("Total: \n £${basket.getBasketTotal()} "),
            ],
          ),

          Row(
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
          )
        ],
      ),
    );
  }
}
