import 'maps.dart';
import 'favorites.dart';
import 'account.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MaterialApp(
    title: 'CENT',
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // default index for middle item

  // Define your page widgets here
  final List<Widget> _pages = <Widget>[
    Home(),
    MapsPage(), // Replace with your actual Account Page widget
    Favorites(),
    AccountsPage(),
    // Replace with your actual Favorites Page widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 
                  ? Icons.home_sharp 
                  : Icons.home_outlined,
                size: 42,
                color: Colors.black,
              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1
                    ? CupertinoIcons.location_fill
                    : CupertinoIcons.location,
                size: 42,
                color: Colors.black,
              ),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? CupertinoIcons.plus_square_fill
                    : CupertinoIcons.plus_square,
                size: 42,
                color: Colors.black,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                size: 42,
                color: Colors.black,
              ),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 4
                    ? CupertinoIcons.person_circle_fill
                    : CupertinoIcons.person_circle,
                size: 42,
                color: Colors.black,
              ),
              label: 'Posts',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
