import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/components/shoe_tile.dart';
import 'package:shoes_app/models/cart.dart';
import 'package:shoes_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Không dùng Provider: bạn phải truyền Cart qua constructor từ trên xuống dưới → code rối.
  // Dùng Provider: đăng ký một lần ở root → gọi ở đâu cũng được thông qua context.
  // notifyListeners() giúp UI tự động rebuild khi Cart thay đổi.

  // Method add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addShoeToCart(shoe);

    // Alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added !"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Consumer<T> là một widget đặc biệt dùng để lắng nghe sự thay đổi từ một
    // ChangeNotifier (ở đây là Cart) và rebuild UI mỗi khi có thay đổi.
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Search", style: TextStyle(color: Colors.grey)),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Everyone flies, some fly longer than others",
              style: TextStyle(color: Colors.grey[600], fontSize: 9),
            ),
          ),

          // Hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "Hot Picks",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Shoes
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Get shoes from shop list
                Shoe shoe = value.getShoeList()[index];

                return ShoeTile(
                  shoe: shoe,
                  // Thực hiện logic khi bấm nút plus
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
