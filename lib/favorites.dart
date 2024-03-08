// File contains 'Favorites' page

import 'account.dart';
import 'maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete }

// Class for storing individual restaurant data
class Restaurant {
  final String name;
  final String restaurantType; // Italian, American, etc.
  final int discount;
  final String discountSymbol; // Either '%' or '$'
  final int drivingTime; // Currently not used
  final int openHour;
  final int closeHour;
  final String openAmPm; // Either 'a' or 'p'
  final String closeAmPm; // Either 'a' or 'p'
  final int
      expensivity; // Symbol is '$'. More symbols = more expensive. Max = 4.

  Restaurant({
    required this.name,
    required this.restaurantType,
    required this.discount,
    required this.discountSymbol,
    required this.drivingTime, // Currently not used
    required this.openHour,
    required this.closeHour,
    required this.openAmPm,
    required this.closeAmPm,
    required this.expensivity,
  });
}

// Object storing actual restaurant data
final info = [
  Restaurant(
    name: '',
    restaurantType: '',
    discount: 0,
    discountSymbol: '',
    drivingTime: 0,
    openHour: 0,
    closeHour: 0,
    openAmPm: '',
    closeAmPm: '',
    expensivity: 0,
  ),
  Restaurant(
    name: 'Tasty Bites',
    restaurantType: 'Italian',
    discount: 20,
    discountSymbol: '%',
    drivingTime: 3,
    openHour: 9,
    closeHour: 10,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 2,
  ),
  Restaurant(
    name: 'Spicy Delight',
    restaurantType: 'Indian',
    discount: 3,
    discountSymbol: '\$',
    drivingTime: 4,
    openHour: 12,
    closeHour: 8,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 2,
  ),
  Restaurant(
    name: 'Sushi Heaven',
    restaurantType: 'Japanese',
    discount: 5,
    discountSymbol: '\$',
    drivingTime: 5,
    openHour: 12,
    closeHour: 12,
    openAmPm: 'p',
    closeAmPm: 'p',
    expensivity: 3,
  ),
  Restaurant(
    name: 'Mexican Fiesta',
    restaurantType: 'Mexican',
    discount: 25,
    discountSymbol: '%',
    drivingTime: 8,
    openHour: 5,
    closeHour: 10,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 1,
  ),
  Restaurant(
    name: 'BBQ Grillers',
    restaurantType: 'American',
    discount: 10,
    discountSymbol: '\$',
    drivingTime: 8,
    openHour: 6,
    closeHour: 9,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 1,
  ),
  Restaurant(
    name: 'Noodle World',
    restaurantType: 'Asian',
    discount: 8,
    discountSymbol: '\$',
    drivingTime: 9,
    openHour: 9,
    closeHour: 10,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 3,
  ),
  Restaurant(
    name: 'Mediterranean Delight',
    restaurantType: 'Mediterranean',
    discount: 30,
    discountSymbol: '%',
    drivingTime: 10,
    openHour: 8,
    closeHour: 11,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 2,
  ),
  Restaurant(
    name: 'Gourmet Burgers',
    restaurantType: 'Burgers',
    discount: 10,
    discountSymbol: '%',
    drivingTime: 10,
    openHour: 7,
    closeHour: 11,
    openAmPm: 'a',
    closeAmPm: 'p',
    expensivity: 3,
  ),
  Restaurant(
    name: '',
    restaurantType: '',
    discount: 0,
    discountSymbol: '',
    drivingTime: 0,
    openHour: 0,
    closeHour: 0,
    openAmPm: '',
    closeAmPm: '',
    expensivity: 0,
  ),
];

// Creating the screen. StatefulWidget used bc of animations.
class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Used to print 'Favorites' title (and maybe pfp?)
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        bottomOpacity: 1.0,
        scrolledUnderElevation: 1.0,
        backgroundColor: Colors.white,
        toolbarHeight: 135.0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
            child: Text(
              'Favorites',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        // Contains list of slidable tiles
        child: SlidableAutoCloseBehavior(
          closeWhenOpened: true,
          child: ListOfFavorites(),
        ),
      ),
      // bottomNavigationBar: Container(
      //   // Creates shadow to outline BottomNavigationBar
      //   decoration: const BoxDecoration(
      //     boxShadow: <BoxShadow>[
      //       BoxShadow(
      //         blurRadius: 10,
      //         color: Colors.grey,
      //       ),
      //     ],
      //   ),
      //   child: SizedBox(
      //     height: 118,
      //     child: BottomNavigationBar(
      //       // Containes 5 icon buttons
      //       backgroundColor: Colors.white,
      //       showSelectedLabels: false,
      //       showUnselectedLabels: false,
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           // Home screen
      //           icon: Icon(
      //             size: 42.0,
      //             Icons.home,
      //             color: Colors.black,
      //           ),
      //           label: 'Home',
      //         ),
      //         BottomNavigationBarItem(
      //           // Map screen
      //           icon: Icon(
      //             size: 42.0,
      //             Icons.location_on_outlined,
      //             color: Colors.black,
      //           ),
      //           label: 'Maps',
      //         ),
      //         BottomNavigationBarItem(
      //           // Camera Screen
      //           icon: Icon(
      //             size: 42.0,
      //             Icons.add_box_outlined,
      //             color: Colors.black,
      //           ),
      //           label: 'Camera',
      //         ),
      //         BottomNavigationBarItem(
      //           // Favorites screen (unusable bc already in screen)
      //           icon: Icon(
      //             size: 42.0,
      //             CupertinoIcons.heart,
      //             color: Colors.black,
      //           ),
      //           label: 'Favorites',
      //         ),
      //         BottomNavigationBarItem(
      //           // Account screen (SecondRoute)
      //           icon: Icon(
      //             size: 42.0,
      //             Icons.account_circle_outlined,
      //             color: Colors.black,
      //           ),
      //           label: 'Account',
      //         ),
      //       ],
      //       onTap: (index) {
      //         switch (index) {
      //           case 1:
      //             Navigator.push(
      //               // Go to Home screen
      //               context,
      //               MaterialPageRoute(builder: (context) => MapsPage()),
      //             );
      //             break;
      //           case 3:
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Favorites()),
      //             );
      //             break;
      //           case 4:
      //             Navigator.push(
      //               // Go to Account screen
      //               context,
      //               MaterialPageRoute(builder: (context) => AccountsPage()),
      //             );
      //             break;
      //           default: // Favorites item is basically a no-op since we are already on the Favorites screen
      //         }
      //       },
      //       type: BottomNavigationBarType.fixed,
      //     ),
      //   ),
      // ),
    );
  }
}

// Slidable list creation
class ListOfFavorites extends StatefulWidget {
  const ListOfFavorites({super.key});

  @override
  State<ListOfFavorites> createState() => _ListOfFavoritesState();
}

class _ListOfFavoritesState extends State<ListOfFavorites> {
  // Deletes restaurant data from 'info' object
  void _onDismissed(int index, Actions action) {
    setState(() {
      info.removeAt(index);
    });
  }

  // Builds discount format. Format: either '10%' or '$10'.
  String discountBuilder(int index, String symbol) {
    return symbol == '%'
        ? '${info[index].discount}$symbol\nOFF'
        : '$symbol${info[index].discount}\nOFF';
  }

  // Builds dollar-sign indicator (expensivity)
  String dollarsIndicator(int num) {
    String str = '';
    for (int i = 0; i < num; i++) {
      str += '\$';
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // Used .separated to generate dividers
      itemCount: info.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        final information = info[index];
        if (index == 0 || index == info.length - 1) {
          // Takes care of starting and ending dividers
          return Container();
        }
        return Slidable(
          key: Key(information.name),
          endActionPane: ActionPane(
            motion: const StretchMotion(), // Sliding animation
            extentRatio: 0.25,
            dismissible: DismissiblePane(
              // Sliding the tile all the way (automatically delete)
              onDismissed: () => _onDismissed(index, Actions.delete),
            ),
            children: [
              SlidableAction(
                // Sliding tile part way to reveal 'Delete' button
                onPressed: (context) {
                  _onDismissed(index, Actions.delete);
                },
                icon: CupertinoIcons.trash,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          child: Builder(// Actual tile builder
            builder: (context) {
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 5.0, 0.0),
              minVerticalPadding: 0.0,
              tileColor: Colors.white,
              title: IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(
                      height: 68.9,
                      width: 210.0,
                      child: Column(
                        // Restaurant name & resturant type
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            info[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            info[index].restaurantType,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // Discount
                      child: SizedBox(
                        child: Text(
                            discountBuilder(index, info[index].discountSymbol),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                            )),
                      ),
                    ),
                    const VerticalDivider(
                      // Divider
                      width: 12,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      // Open/close times & expensivity
                      width: 111,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${info[index].openHour}:00${info[index].openAmPm}-${info[index].closeHour}:00${info[index].closeAmPm}',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                dollarsIndicator(info[index].expensivity),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                dollarsIndicator(4 - info[index].expensivity),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Closes one tile when opening another or when scrolling
                final slidable = Slidable.of(context)!;
                final isClosed =
                    slidable.actionPaneType.value == ActionPaneType.none;
                if (isClosed) {
                  slidable.openStartActionPane();
                } else {
                  slidable.close();
                }
              },
            );
          }),
        );
      },
      //separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
    );
  }
}
