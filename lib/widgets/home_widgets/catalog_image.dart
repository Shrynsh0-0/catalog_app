import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final isAsset = image.startsWith("assets/");

    return (isAsset ? Image.asset(image) : Image.network(image)).box.p8
        .make()
        .p8()
        .w40(context);
  }
}
