import 'package:flutter/material.dart';
import 'package:shoes_app/components/bottom_nav_bar.dart';
import 'package:shoes_app/pages/cart_page.dart';
import 'package:shoes_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Thay đổi index mỗi khi chuyển tab, mỗi tab là mỗi index khác nhau
  void navigateBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Chuyển page dựa trên index
  final List<Widget> _pages = [
    // Cart
    const CartPage(),

    // Shope
    const ShopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottombar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
