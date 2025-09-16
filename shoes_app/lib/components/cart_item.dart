import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;

  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Method delete shoe from cart
  void deleteShoeFromCart() {
    Provider.of<Cart>(context, listen: false).deleteShoeFromCart(widget.shoe);

    // Alert the user, shoe successfully deleted
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully deleted !"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // UI of cartitem
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),

        // Action btn
        trailing: IconButton(
          onPressed: deleteShoeFromCart,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
