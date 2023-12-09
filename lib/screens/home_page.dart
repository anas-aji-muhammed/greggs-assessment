import 'package:flutter/material.dart';
import 'package:greggs_challenge/screens/basket_page.dart';
import 'package:provider/provider.dart';

import '../controllers/basket_controller.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductModel product; // variable to hold the fetched product
  bool isLoading = true; //variable for holding loading state

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the widget is initialized
  }

  //Method to fetch the product data.
  Future<void> _fetchData() async {
    try {
      final apiService = ApiService();
      final productList = await apiService.fetchProductData();
      setState(() {
        product = productList; // Update the product
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<BasketController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        actions: [
          Row(
            children: [
              Text(
                basket.eatIn ? 'Eat In' : 'Eat out', // Display "Eatin" or "Eatout"
              ),
              Switch(
                value: basket.eatIn,
                onChanged: (bool value) {
                  basket.toggleEatIn();
                },),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>  const BasketPage(),
            ),
          );
        },
        child: const Icon(Icons.shopping_basket),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Loading indicator
            )
          : ProductWidget(
            product: product,

          ),
    );
  }
}
