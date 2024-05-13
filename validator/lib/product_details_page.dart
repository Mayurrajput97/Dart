import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;

  ProductDetailsPage(this.productName);

  @override
  Widget build(BuildContext context) {
    // Fetch product details for the selected product
    // For demonstration purposes, creating a dummy description
    String description = 'Long description of $productName';

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details - $productName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Add multiple images here
            Image.asset('assets/product_image.png', width: 200),
            Image.asset('assets/product_image.png', width: 200),
            // Add more images as needed
          ],
        ),
      ),
    );
  }
}
