import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  const MyDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text(username),
              accountEmail: Text("angryprash.com"),
              currentAccountPicture: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.person_add),
            title: Text("Signup"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text("E-Mail"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart),
            title: Text("Cart"),
          ),
        ],
      ),
    );
  }
}
