import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.0,
        leading: Padding( // Back arrow
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios), 
          ),
        ),
        title: const Padding( // Gear Icon
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Icon(
            CupertinoIcons.gear,
            size: 50,
          ),
        ),
      ),

      // List Content
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding( // Divider
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Divider(
                thickness: 2,
                color: Color.fromARGB(255, 218, 218, 218),
              ),
            ),

            // Your Account
            const Padding(
              padding: EdgeInsets.fromLTRB(21, 0, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Your Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'TimesNewRoman',
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding( // Password
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Privacy',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'App Appearance',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20,),

            // Info & Support
            const Padding(
              padding: EdgeInsets.fromLTRB(21, 0, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 40,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Info & Support',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'TimesNewRoman',
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "FAQ's",
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Help',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    title: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'TimesNewRoman',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}