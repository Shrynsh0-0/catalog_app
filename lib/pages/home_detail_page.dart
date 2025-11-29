import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: OverflowBar(
        alignment: MainAxisAlignment.spaceBetween,
                overflowAlignment: OverflowBarAlignment.start,
                spacing: 10,
                children: [
                  "₹${catalog.price}".text.bold.xl3.make(),
                  AddToCart(catalog: catalog)
                ],
      ).p16(),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
          ).h48(context),
          Expanded(
              child: VxArc(
            height: 30,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: Colors.purpleAccent,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.lg.bold.xl4.make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  10.heightBox,
                  
                ],
              ).py32(),
            ),
          )
          )
        ],
      ) //for future ad p16 here
      )
    );
  }
}
