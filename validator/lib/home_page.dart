import 'package:flutter/material.dart';
import 'product_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Products'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildCategoryTile(context, 'Mobiles', 'assets/mobiles.png',
              'Shop for mobile phones'),
          _buildCategoryTile(
              context, 'Laptops', 'assets/laptop.png', 'Explore laptops'),
          _buildCategoryTile(
              context, 'TVs', 'assets/laptop.png', 'Discover TVs'),
          _buildCategoryTile(
              context, 'Headphones', 'assets/headset.png', 'Find headphones'),
          _buildCategoryTile(context, 'Mobiles', 'assets/mobiles.png',
              'Shop for mobile phones'),
          _buildCategoryTile(
              context, 'Headphones', 'assets/headset.png', 'Find headphones'),
          _buildCategoryTile(
              context, 'Headphones', 'assets/headset.png', 'Find headphones'),
          _buildCategoryTile(
              context, 'Headphones', 'assets/headset.png', 'Find headphones'),
          _buildCategoryTile(
              context, 'Headphones', 'assets/headset.png', 'Find headphones'),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(
      BuildContext context, String title, String iconPath, String description) {
    return ListTile(
      leading: Image.asset(iconPath, width: 40),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductListPage(category: title)),
        );
      },
    );
  }
}
