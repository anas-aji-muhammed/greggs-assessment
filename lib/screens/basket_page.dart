import 'package:flutter/material.dart';
import 'package:greggs_challenge/widgets/product_widget.dart';
import 'package:provider/provider.dart';

import '../controllers/basket_controller.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket Page"),
      ),
      body: (basket.item==null)? const Center(child:  Text("No item in the basket. \nPlease add from homepage"))
      : Column(
        children: [
          ProductWidget(
              product: basket.item!,
          )
        ],
      ),
    );
  }
}
