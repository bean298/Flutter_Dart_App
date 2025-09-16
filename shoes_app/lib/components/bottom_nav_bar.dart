import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  // Tham số sẽ là kiểu int, ko trả về gì
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20), //Padding đối xứng dọc
      child: GNav(
        color: Colors.grey[400], //Màu sắc lúc chưa đc chọn
        activeColor: Colors.grey.shade700, //Màu sắc lúc đc chọn
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(icon: Icons.home, text: "Shop"),
          GButton(icon: Icons.shopping_bag_rounded, text: "Cart"),
        ],
      ),
    );
  }
}
