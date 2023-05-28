import 'package:clicker/view/pages/home/profile_page.dart';
import 'package:clicker/view/pages/home/shop_page.dart';
import 'package:clicker/view/utils/colors.dart';
import 'package:flutter/material.dart';

import 'bless_page.dart';
import 'clicker_page.dart';
import 'iq_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


List<Widget?> pages = [
  ProfilePage(),
  ClickerPage(),
  ShopPage()
];


class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _onTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.base,
        currentIndex: selectedIndex,
        onTap: _onTap,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.earth,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "Профиль"),
          BottomNavigationBarItem(icon: Icon(Icons.wb_incandescent), label: "кликать"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "шоп")
        ],
      ),
    );
  }

}
