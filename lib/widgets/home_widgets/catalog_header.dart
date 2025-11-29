import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  final VoidCallback openDrawer; //you can remove this

  const CatalogHeader({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String username = args?["username"] ?? "Shopper";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Catalog App".text.xl5.bold.make(),
            "Hello $username :)".text.xl.make(),
            SizedBox(height: 10),
          ],
        ),
        //Builder(
        //builder: (context) => IconButton(
        //  icon: Icon(Icons.menu, size: 30),
        //  onPressed: () {
        //    Scaffold.maybeOf(context)?.openDrawer();
        //  },
        //),
        IconButton(
          icon: Icon(Icons.menu, size: 30),
          onPressed: openDrawer,
        ),
      ],
    );
  }
}
