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
    // Shope
    const ShopPage(),

    // Cart
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // Header trên đầu điện thoại để có thể mở Drawer
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu, color: Colors.black),
            ),
          ),
        ),
      ),
      // Gọi Drawer, chỉnh giao diện cho Drawer
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Logo
                DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "lib/images/Logo_NIKE.svg.png",
                    height: 200,
                    width: 200,
                    color: Colors.white,
                  ),
                ),

                // Other pages
                // Home
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text("Home", style: TextStyle(color: Colors.white)),
                  ),
                ),

                // Profile
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text("About", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            // Logout
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 10.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottombar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
