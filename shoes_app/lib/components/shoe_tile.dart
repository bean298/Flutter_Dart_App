import 'package:flutter/material.dart';
import 'package:shoes_app/models/shoe.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  // Use shoe model
  Shoe shoe;

  void Function()? onTap;

  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe picture
          ClipRRect(
            child: Image.asset(shoe.imagePath),
            borderRadius: BorderRadius.circular(12),
          ),

          // Description
          Text(shoe.description, style: TextStyle(color: Colors.grey[600])),

          // Price, details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // Name
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    // Price
                    Text(
                      shoe.price,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                // Plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Button to add to cart
        ],
      ),
    );
  }
}
