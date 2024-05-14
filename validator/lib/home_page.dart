import 'package:flutter/material.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productList = [
      {
        'name': 'Iphone 14',
        'image': 'mobiles.png',
        'price': '\$999',
        'camera': '12 MP',
        'ram': '6 GB',
        'rom': '128 GB',
      },
      {
        'name': 'Iphone SE',
        'image': 'mobiles.png',
        'price': '\$399',
        'camera': '12 MP',
        'ram': '3 GB',
        'rom': '64 GB',
      },
      {
        'name': 'Samsung Galaxy',
        'image': 'samsung.jpg',
        'price': '\$1099',
        'camera': '108 MP',
        'ram': '8 GB',
        'rom': '256 GB',
      },
      {
        'name': 'One Plus 7',
        'image': 'oneplus.png',
        'price': '\$599',
        'camera': '48 MP',
        'ram': '8 GB',
        'rom': '128 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
      {
        'name': 'Asus ROG',
        'image': 'asus.png',
        'price': '\$899',
        'camera': '64 MP',
        'ram': '12 GB',
        'rom': '256 GB',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Products'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/${productList[index]['image']}'),
            ),
            title: Text(productList[index]['name']!),
            subtitle: Text('Price: ${productList[index]['price']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    product: Product(
                      name: productList[index]['name']!,
                      image: productList[index]['image']!,
                      price: productList[index]['price']!,
                      camera: productList[index]['camera']!,
                      ram: productList[index]['ram']!,
                      rom: productList[index]['rom']!,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
