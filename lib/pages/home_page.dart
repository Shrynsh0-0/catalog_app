import 'package:catalog_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String username = args?["username"] ?? "guest";
    int days = 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: TextButton.styleFrom(),
            child: Text("Login"),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Hemlo $username ! Try to complete this app in $days days :)",
        ),
      ),
      drawer: Drawer(),
    );
  }
}
