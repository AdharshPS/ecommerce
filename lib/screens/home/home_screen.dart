import 'package:ecommerce/const/colorconst/app_color_const.dart';
import 'package:ecommerce/screens/login/login_sceen.dart';
import 'package:ecommerce/service/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<LoginController>(context);

    final List<Widget> screens = [
      const Center(child: Text('Home Page')),
      const Center(child: Text('Search Page')),
      const Center(child: Text('Cart Page')),
      const Center(child: Text('Profile Page')),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              auth.logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.transparent,
              // color: AppColorConst.primary.withValues(alpha: .1),
            ),
          ],
        ),
        child: SafeArea(
          child: GNav(
            hoverColor: Colors.grey.shade700,
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            tabShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: .5),
                blurRadius: 8,
              ),
            ],
            curve: Curves.bounceIn,
            duration: Duration(milliseconds: 530),
            gap: 4,
            color: AppColorConst.primary.withValues(alpha: 09),
            activeColor: Colors.purple,
            iconSize: 24,
            tabBackgroundColor: Colors.purple.withValues(alpha: 0.1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.shopping_cart, text: 'Cart'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
