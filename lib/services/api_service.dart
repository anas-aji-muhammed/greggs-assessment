import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';

class ApiService {
  Future<ProductModel> fetchProductData() async {
    try {
      // Load the JSON data from the assets directory
      final jsonString = await rootBundle.loadString('assets/api_data.json');

      //Convert json to product model
      ProductModel product = ProductModel.fromRawJson(jsonString);
      return product;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      rethrow;
    }
  }
}
