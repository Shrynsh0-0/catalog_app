import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item))
    .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String username = args?["username"] ?? "Shopper";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: const Icon(Icons.login),
            style: TextButton.styleFrom(),
            label: Text("Login"),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello $username :)",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index]);
                },
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(username: username),
    );
  }
}
