import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Shrink SideMenu',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Liquid Ui Shrink SideMenus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //codigo nav menu
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  //codigo slider menu
  bool isOpened = false;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  //@override
  //Widget build(BuildContext context) {
  //  return  SideMenu(
  //      key: _sideMenuKey,
  //      background: Colors.blue[700],
  //      menu: buildMenu(),
  //      type: SideMenuType.shrinkNSlide,
  //      onChange: (_isOpened) {
  //        setState(() => isOpened = _isOpened);
  //      },
  //      child: IgnorePointer(
  //        ignoring: isOpened,
  //        child: Scaffold(
  //          appBar: AppBar(
  //            centerTitle: true,
  //            leading: IconButton(
  //              icon: const Icon(Icons.menu),
  //              onPressed: () => toggleMenu(),
  //            ),
  //            title: Text(widget.title),
  //          ),
  //        ),
  //      ),
  //  );
  //}
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return SideMenu(
      key: _sideMenuKey,
      background: Colors.blue[700],
      menu: buildMenu(),
      type: SideMenuType.shrinkNSlide,
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => toggleMenu(),
            ),
            title: Text(widget.title),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
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
              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite,
                  size: 56,
                  color: Colors.blue[700],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite,
                  size: 56,
                  color: Colors.blue[700],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.chat,
                  size: 56,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          bottomNavigationBar: WaterDropNavBar(
            backgroundColor: navigationBarColor,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad,
              );
            },
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                filledIcon: Icons.home,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                filledIcon: Icons.bookmark,
                outlinedIcon: Icons.bookmark_border_outlined,
              ),
              BarItem(
                filledIcon: Icons.favorite,
                outlinedIcon: Icons.favorite_border_rounded,
              ),
              BarItem(
                filledIcon: Icons.chat,
                outlinedIcon: Icons.chat_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, John Doe",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
