import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/components/cart_item.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Consumer<T> là một widget đặc biệt dùng để lắng nghe sự thay đổi từ một
    // ChangeNotifier (ở đây là Cart) và rebuild UI mỗi khi có thay đổi.
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Text(
              "My cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // Get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  return CartItem(shoe: individualShoe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
