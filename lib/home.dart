import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'favorites.dart';
import 'accounts.dart';
import 'maps.dart';

class Post {
  // Contains the info of each post
  bool like = false;
  int likes = 0;
  final String username;
  final String location;
  final int discount;
  final String discountSymbol;
  final String
      image; // Used assets to store image files. See flutter/assets in pubspec.yaml
  final String text;

  Post({
    required this.username,
    required this.location,
    required this.discount,
    required this.discountSymbol,
    required this.image,
    required this.text,
  });
}

final postInfo = [
  Post(
    username: 'Username',
    location: 'Chipotle Mexican Grill',
    discount: 3,
    discountSymbol: '\$',
    image: 'photos/IMG_6663copy.jpeg',
    text:
        'I will never say "no" to chipotle! I always get a bowl with double white rice, chicken, and at least 4 scoops of pico and lettuce. Definitely worth it! Total cost: \$9.87.',
  ),
  Post(
    username: 'John Doe',
    location: 'Noodle World',
    discount: 7,
    discountSymbol: '\$',
    image: 'photos/thai-noodles-5-22-10-3247233573.jpg',
    text: 'The noodles are absolutely awesome!!!',
  ),
];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Used to print 'CENT' title (and maybe pfp?)
        shape: const Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        )),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        bottomOpacity: 1.0,
        scrolledUnderElevation: 1.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 15.0),
          child: Text(
            'CENT',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'TimesNewRoman',
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: const ListOfPosts(),
      bottomNavigationBar: Container(
        // Creates shadow to outline BottomNavigationBar
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey,
            ),
          ],
        ),
        child: SizedBox(
          height: 118,
          child: BottomNavigationBar(
            // Containes 5 icon buttons
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // Home screen
                icon: Icon(
                  size: 42.0,
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                // Map screen
                icon: Icon(
                  size: 42.0,
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                // Camera Screen
                icon: Icon(
                  size: 42.0,
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                // Favorites screen (unusable bc already in screen)
                icon: Icon(
                  size: 42.0,
                  CupertinoIcons.heart,
                  color: Colors.black,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                // Account screen (SecondRoute)
                icon: Icon(
                  size: 42.0,
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                label: 'Account',
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 1:
                  Navigator.push(
                    // Go to Home screen
                    context,
                    MaterialPageRoute(builder: (context) => MapsPage()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Favorites()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    // Go to Account screen
                    context,
                    MaterialPageRoute(builder: (context) => AccountsPage()),
                  );
                  break;
                default: // Favorites item is basically a no-op since we are already on the Favorites screen
              }
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

class ListOfPosts extends StatefulWidget {
  const ListOfPosts({super.key});

  @override
  State<ListOfPosts> createState() => _ListOfPostsState();
}

class _ListOfPostsState extends State<ListOfPosts> {
  String discountBuilder(int index, String symbol) {
    return symbol == '%'
        ? '${postInfo[index].discount}$symbol OFF'
        : '$symbol${postInfo[index].discount} OFF';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: postInfo.length,
        itemBuilder: (BuildContext context, int index) {
          final information = postInfo[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    // User pfp, username, location, discount
                    children: [
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: NetworkImage('https://www.iamag.co/wp-content/uploads/2013/05/pacifirim1.jpg'),
                      //   backgroundColor: Colors.transparent,
                      // ),
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              information.username,
                              style: const TextStyle(
                                  //fontFamily: 'Helvetica',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(information.location),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(
                            discountBuilder(index, information.discountSymbol),
                            style: const TextStyle(
                              fontSize: 26,
                              fontFamily: 'Helvetica',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image(
                  // Post image
                  image: AssetImage(information.image),
                  height: 380,
                  width: 395,
                  fit: BoxFit.fitWidth,
                ),
                // Image.file(
                //   File(information.image),
                //   height: 380,
                //   width: 395,
                //   fit: BoxFit.fitWidth,
                // ),
                //Image.network('https://im.ziffdavisinternational.com/ign_de/screenshot/default/pacific-rim-22569-2880x1800_reqd.jpg'),
                Padding(
                  // Interactive heart icon, number of "likes", description
                  padding: const EdgeInsets.fromLTRB(3, 3, 10, 0),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      setState(() {
                                        information.like = !information.like;
                                        if (information.like) {
                                          information.likes += 1;
                                        } else {
                                          information.likes -= 1;
                                        }
                                      });
                                    },
                                    icon: information.like == true
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 35,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            size: 35,
                                          )),
                                Text(
                                  '${information.likes}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 8, 0, 0),
                              child: Text(
                                information.text,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
