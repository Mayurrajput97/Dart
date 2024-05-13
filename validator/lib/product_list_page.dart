import 'package:flutter/material.dart';
import 'product_details_page.dart';

class ProductListPage extends StatelessWidget {
  final String category;

  ProductListPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Fetch list of products for the selected category
    // For demonstration purposes, creating a dummy list
    List<String> productList = ['Product 1', 'Product 2', 'Product 3'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Products - $category'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(productList[index])),
              );
            },
          );
        },
      ),
    );
  }
}
