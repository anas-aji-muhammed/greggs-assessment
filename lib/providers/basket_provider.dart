import 'package:flutter/foundation.dart';
import 'package:greggs_challenge/models/product_model.dart';

// For managing basket state
class BasketProvider extends ChangeNotifier {
  ProductModel? item;
  double totalBasketPrice = 0.0;
  bool eatIn = true;

  //Method to add product to basket
  void addToBasket(ProductModel product, bool isIncrement) {
    if (item == null) {
      item = product;
      item!.quantity = 1;
    } else {
      if (isIncrement) {
        item!.quantity += 1;
      } else {
        if (item!.quantity == 1) {
          removeFromBasket(product);
        } else {
          item!.quantity -= 1;
        }
      }
    }
    getBasketTotal();
    notifyListeners();
  }

  //Method to remove product from basket
  void removeFromBasket(ProductModel product) {
    item = null;
    totalBasketPrice = 0;
    notifyListeners();
  }

  //Returns basket total
  Object getBasketTotal() {
    if (item == null) return 0.00;
    if (eatIn) {
      totalBasketPrice = item!.eatInPrice * item!.quantity;
    } else {
      totalBasketPrice = item!.eatOutPrice * item!.quantity;
    }

    return totalBasketPrice.toStringAsFixed(2);
  }

  //Toggle between eatin and eatout
  void toggleEatIn() {
    eatIn = !eatIn;
    notifyListeners();
  }
}
