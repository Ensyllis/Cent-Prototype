import 'maps.dart';
import 'favorites.dart';
import 'accounts.dart';
import 'picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  final CameraDescription camera;

  const MainPage({Key? key, required this.camera}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1; // default index for middle item

  // Define your page widgets here
  final List<Widget> _pages = <Widget>[
    AccountsPage(), // Replace with your actual Account Page widget
    MapsPage(), // Replace with your actual Maps Page widget
    const Favorites(),
    TakePictureScreen(camera: widget.camera), // Replace with your actual Favorites Page widget
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0
                  ? Icons.account_box
                  : Icons.account_box_outlined,
              size: 30,
              color: Colors.black,
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? CupertinoIcons.map_fill
                  : CupertinoIcons.map,
              size: 30,
              color: Colors.black,
            ),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? CupertinoIcons.camera_fill
                  : CupertinoIcons.camera,
              size: 30,
              color: Colors.black,
            ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3
                  ? CupertinoIcons.heart_fill
                  : CupertinoIcons.heart,
              size: 30,
              color: Colors.black,
            ),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
