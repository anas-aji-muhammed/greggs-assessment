import 'package:flutter/material.dart';
import 'package:greggs_challenge/widgets/product_widget.dart';
import 'package:provider/provider.dart';

import '../providers/basket_provider.dart';
import '../widgets/basket_product_widget.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});
  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket Page"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text("Total:- £ ${basket.getBasketTotal()}"),
          heightFactor: .5,),
      ),
      body: (basket.item==null)? const Center(child:  Text("No item in the basket. \nPlease add from homepage"))
      : const Column(
        children: [
          BasketProductWidget()
        ],
      ),
    );
  }
}
