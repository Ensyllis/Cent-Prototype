import 'package:Cent_Prototype/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.0,
        title: const Padding( // "Username"
          padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
          child: Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
        ),
        actions: <Widget> [ // Settings Button
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SizedBox(
              width: 90,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsScreen()));
                },
                icon: const Icon(
                  CupertinoIcons.gear,
                  size: 40,
                ),
              ),
            ),
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const SizedBox( // PFP
              width: 343,
              height: 100,
              child: CircleAvatar(
                radius: 50, // Profile picture radius
                // backgroundImage: NetworkImage('your_image_url_here'), // Uncomment and replace with actual image url
              ),
            ),
            const SizedBox(height: 10),
            const Text( // Bio Description
              'Bio description (2-3 lines)',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // 3 Tabs (not yet implemented)
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 35,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      iconSize: 38,
                      onPressed: () {}, 
                      icon: const Icon(
                        Icons.grid_view,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      iconSize: 38,
                      onPressed: () {}, 
                      icon: const Icon(
                        CupertinoIcons.money_dollar,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 38,
                      onPressed: () {}, 
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),

            // Tab Content (not yet implemented)
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                // Handle profile edit
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Handle password change
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Handle notifications
              },
            ),
          ],
        ),
      )
    );
  }
}