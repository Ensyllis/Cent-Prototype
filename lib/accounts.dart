import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50, // Profile picture radius
                // backgroundImage: NetworkImage('your_image_url_here'), // Uncomment and replace with actual image url
              ),
              SizedBox(height: 10),
              Text(
                'User Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'user@example.com',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
                onTap: () {
                  // Handle profile edit
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  // Handle password change
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  // Handle notifications
                },
              ),
              ElevatedButton(
                child: Text('Sign Out'),
                onPressed: () {
                  // Handle user sign out
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
