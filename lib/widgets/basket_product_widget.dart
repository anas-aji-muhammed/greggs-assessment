import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greggs_challenge/widgets/product_add_update_widget.dart';
import 'package:greggs_challenge/widgets/product_image_widget.dart';
import 'package:provider/provider.dart';

import '../providers/basket_provider.dart';


class BasketProductWidget extends StatelessWidget {
  const BasketProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProductImageWidget(imageUrl: basket.item!.imageUri, width: .2,),
                  const SizedBox(width: 20,),
                  Text(basket.item!.articleName,),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                    onPressed: (){
                      basket.removeFromBasket(basket.item!);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Product Removed!'),
                      ));                  },
                    icon: const Icon(Icons.cancel_outlined)
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Quantity: ${basket.item?.quantity} Nos"),
              Text("Total: £${basket.getBasketTotal()}"),

            ],
          ),
          ProductAddUpdateWidget(product: basket.item!,)

        ],
      ),
    );
  }
}
