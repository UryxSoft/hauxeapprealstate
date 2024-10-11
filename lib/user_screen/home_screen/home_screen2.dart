import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';

class MyBottomNavyBar extends StatefulWidget {
  const MyBottomNavyBar({Key? key}) : super(key: key);
  @override
  BottomNavyBarState createState() => BottomNavyBarState();
}

class BottomNavyBarState extends State<MyBottomNavyBar> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            child: ContainedTabBarView(
              tabs: [
                Text('Hause'),
                Text('Apartment'),
                Text('Resort'),
                Text('Built'),
              ],
              tabBarProperties: TabBarProperties(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                indicator: ContainerTabIndicator(
                  radius: BorderRadius.circular(1),
                  borderWidth: 3.0,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[400],
              ),
              views: [
                Container(color: Colors.red),
                Container(color: Colors.green),
                Container(color: Colors.green),
                Container(color: Colors.red),
              ],
              onChange: (index) => print(index),
            ),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 55.0,
        backgroundColor: Colors.white70,
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Color(0xFF0064E5),
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: Color(0xFF0064E5),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color(0xFF0064E5),
            icon: const Icon(Icons.bookmark_outlined),
            title: const Text('Favorite'),
            activeColor: Color(0xFF0064E5),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color(0xFF0064E5),
            icon: const Icon(Icons.chat),
            title: const Text('Chat'),
            activeColor: Color(0xFF0064E5),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Color(0xFF0064E5),
            icon: const Icon(Icons.settings),
            title: const Text(
              'Settings ',
            ),
            activeColor: Color(0xFF0064E5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
