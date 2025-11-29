import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String username = args?["username"] ?? "Shopper";

    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(username: username),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, _) =>
            FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
              child: Icon(CupertinoIcons.cart),
            ).badge(
              count: cart.items.length,
              size: 20,
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(
                openDrawer: () {                             //
                  _scaffoldKey.currentState?.openDrawer();   //
                },                                           //
              ),
              if (CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                LinearProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
