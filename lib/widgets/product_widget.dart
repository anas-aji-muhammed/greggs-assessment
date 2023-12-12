import 'package:flutter/material.dart';
import 'package:greggs_challenge/models/product_model.dart';
import 'package:greggs_challenge/widgets/product_add_update_widget.dart';
import 'package:greggs_challenge/widgets/product_image_widget.dart';
import 'package:provider/provider.dart';

import '../providers/basket_provider.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;
  const ProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      // height: MediaQuery.of(context).size.height * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductImageWidget(
            imageUrl: widget.product.imageUri,
          ),
          Text(widget.product.articleName),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("EatIn: \n £${widget.product.eatInPrice} "),
              Text("EatOut: \n £${widget.product.eatOutPrice} "),
              Text("Total: \n £${basket.getBasketTotal()} "),
            ],
          ),
          ProductAddUpdateWidget(
            product: widget.product,
          )
        ],
      ),
    );
  }
}
