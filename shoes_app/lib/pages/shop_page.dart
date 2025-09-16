import 'package:flutter/material.dart';
import 'package:shoes_app/components/shoe_tile.dart';
import 'package:shoes_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              // Create new shoe
              Shoe shoe = Shoe(
                name: 'Air Jordan 3',
                price: '6.690.000₫',
                imagePath: 'lib/images/jordan_one.jpg',
                description: 'Air Jordan 3 ‘Pure Money’',
              );

              return ShoeTile(shoe: shoe);
            },
          ),
        ),

        // Divider
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Divider(color: Colors.white),
        ),
      ],
    );
  }
}
