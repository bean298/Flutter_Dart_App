import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "Giày Air Jordan 4",
      price: "3.090.000₫",
      imagePath: 'lib/images/jordan_two.jpg',
      description: "Giày Air Jordan 4",
    ),

    Shoe(
      name: "Giày Air Jordan 1",
      price: "3.090.000₫",
      imagePath: 'lib/images/jordan_three.jpg',
      description: "Giày Air Jordan 1",
    ),

    Shoe(
      name: "Giày Jordan 1",
      price: "2.890.000₫",
      imagePath: 'lib/images/jordan_four.jpg',
      description: "Giày Jordan 1",
    ),

    Shoe(
      name: 'Air Jordan 3',
      price: '6.690.000₫',
      imagePath: 'lib/images/jordan_one.jpg',
      description: 'Air Jordan 3 ‘Pure Money’',
    ),
  ];

  // List of items in user cart, empty
  List<Shoe> userCart = [];

  // Get shoes list
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get Cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add shoe to cart
  void addShoeToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners(); //Lắng nghe sự thay đổi và báo cho các widget biết và rebuild lại
  }

  // Delete shoe from cart
  void deleteShoeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
