import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Removes padding from the top
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset("images/person.jpg"), // Add user profile image here
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome, User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'njugunaalekii99@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Home Navigation - Now opens Signup screen
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Signup'),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.pushNamed(context, '/signup'); // Navigate to the Signup Screen
            },
          ),
          // Profile Navigation
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/profile');
            },
          ),
          // Settings Navigation
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/settings');
            },
          ),
          Divider(), // Add a divider between sections
          // Log out
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: () {
              Navigator.of(context).pop();
              // Add your log out functionality here
            },
          ),
        ],
      ),
    );
  }
}
