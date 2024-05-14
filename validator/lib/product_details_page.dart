import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final String price;
  final String camera;
  final String ram;
  final String rom;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.camera,
    required this.ram,
    required this.rom,
  });
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details - ${product.name}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/${product.image}',
            height: 300,
            width: 300,
          ),
          SizedBox(height: 20),
          Text(
            'Name: ${product.name}\nPrice: ${product.price}\nCamera: ${product.camera}\nRAM: ${product.ram}\nROM: ${product.rom}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
