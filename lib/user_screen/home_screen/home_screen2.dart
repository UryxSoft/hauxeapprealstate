import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import '../../user_screen/favorite_screen/favorite_screen.dart';
import '../../user_screen/home_screen/house_screen.dart';
import '../../user_screen/notify_screen/notify_screen.dart';

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
      body: Column(
        children: [
          // Barra superior con ubicación, notificaciones y perfil
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sección de ubicación
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jakarta',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),

                // Sección de notificaciones y perfil
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navegar a MyNotifyPage al hacer clic en la campana
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyNotifyPage()),
                        );
                      },
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications_none,
                            size: 30,
                            color: Colors.black,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // El resto de tu contenido del PageView y BottomNavyBar
          Expanded(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                // Las vistas que ya has configurado, por ejemplo:
                Container(
                  child: ContainedTabBarView(
                    tabs: [
                      Text('House'),
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: HauseScreen(),
                      ),
                      Container(color: Colors.green),
                      Container(color: Colors.green),
                      Container(color: Colors.red),
                    ],
                    onChange: (index) => print(index),
                  ),
                ),
                // Otras páginas
                Container(padding: const EdgeInsets.all(10), child: CardList()),
                Container(),
                Container(),
                // Tu página de configuración, por ejemplo:
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        // user car
                        BigUserCard(
                          backgroundColor: Colors.blue,
                          userName: "Babacar Ndong",
                          userProfilePic: AssetImage("assets/logo.png"),
                          cardActionWidget: SettingsItem(
                            icons: Icons.edit,
                            iconStyle: IconStyle(
                              withBackground: true,
                              borderRadius: 50,
                              backgroundColor: Colors.yellow[600],
                            ),
                            title: "Modify",
                            subtitle: "Tap to change your data",
                            onTap: () {
                              print("OK");
                            },
                          ),
                        ),
                        SettingsGroup(
                          backgroundColor: Colors.white,
                          items: [
                            SettingsItem(
                              onTap: () {},
                              icons: CupertinoIcons.pencil_outline,
                              iconStyle: IconStyle(),
                              title:
                                  'Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance',
                              subtitle:
                                  "Make Ziar'App yours Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance Appearance",
                              titleMaxLine: 1,
                              subtitleMaxLine: 1,
                            ),
                            SettingsItem(
                              onTap: () {},
                              icons: Icons.fingerprint,
                              iconStyle: IconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.red,
                              ),
                              title: 'Privacy',
                              subtitle: "Lock Ziar'App to improve your privacy",
                            ),
                            SettingsItem(
                              onTap: () {},
                              icons: Icons.dark_mode_rounded,
                              iconStyle: IconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.red,
                              ),
                              title: 'Dark mode',
                              subtitle: "Automatic",
                              trailing: Switch.adaptive(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        SettingsGroup(
                          items: [
                            SettingsItem(
                              onTap: () {},
                              icons: Icons.info_rounded,
                              iconStyle: IconStyle(
                                backgroundColor: Colors.purple,
                              ),
                              title: 'About',
                              subtitle: "Learn more about Ziar'App",
                            ),
                          ],
                        ),
                        // You can add a settings title
                        SettingsGroup(
                          settingsGroupTitle: "Account",
                          items: [
                            SettingsItem(
                              onTap: () {},
                              icons: Icons.exit_to_app_rounded,
                              title: "Sign Out",
                            ),
                            SettingsItem(
                              onTap: () {},
                              icons: CupertinoIcons.repeat,
                              title: "Change email",
                            ),
                            SettingsItem(
                              onTap: () {},
                              icons: CupertinoIcons.delete_solid,
                              title: "Delete account",
                              titleStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Aquí va tu BottomNavyBar como ya lo tienes configurado
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
            icon: const Icon(Icons.search_outlined),
            title: const Text('Search'),
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
            title: const Text('Settings'),
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
