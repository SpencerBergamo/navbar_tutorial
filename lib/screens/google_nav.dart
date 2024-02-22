import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNav extends StatefulWidget {
  const GoogleNav({super.key});

  @override
  State<GoogleNav> createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  // initial selectedState value
  int _selectedIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: ListView(
          children: const [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.person, size: 25),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, size: 25),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
          controller: _pageController,
          // children: [_widgetOptions.elementAt(_selectedIndex)],
          children: _widgetOptions,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: const Color.fromARGB(255, 234, 234, 234), width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.center,
              haptic: true,
              backgroundColor: Colors.transparent, // tab button color
              color: const Color.fromARGB(
                  255, 129, 129, 129), // unselected icon color
              activeColor: Colors.blue, // selected icon and text color
              iconSize: 25, // tab button icon size
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // navigation bar padding
              tabMargin: EdgeInsets.zero,
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                ),
                GButton(
                  icon: Icons.account_box_rounded,
                ),
                GButton(
                  icon: Icons.add_circle_rounded,
                ),
                GButton(
                  icon: Icons.notifications,
                ),
                GButton(
                  icon: Icons.settings_rounded,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _pageController.jumpToPage(index);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Home")),
    Center(child: Text('Photos')),
    Center(child: Text('Add')),
    Center(child: Text('QR')),
    Center(child: Text('Search')),
  ];
}
