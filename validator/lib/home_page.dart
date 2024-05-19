import 'package:flutter/material.dart';
import 'product_details_page.dart';
import 'product.dart';

class HomePage extends StatelessWidget {
  final List<Product> productList = [
    Product(
      name: 'Iphone 14',
      image: 'assets/iphone13.png',
      price: '999',
      camera: '12MP',
      ram: '6GB',
      rom: '128GB',
    ),
    Product(
      name: 'Iphone 14 plus',
      image: 'assets/iphone15plus.png',
      price: '799',
      camera: '64MP',
      ram: '8GB',
      rom: '256GB',
    ),
    Product(
      name: 'Iphone 15 plus',
      image: 'assets/iphone15pro.png',
      price: '899',
      camera: '48MP',
      ram: '12GB',
      rom: '512GB',
    ),
    Product(
      name: 'Iphone 15 pro',
      image: 'assets/iphone14plus.png',
      price: '899',
      camera: '48MP',
      ram: '12GB',
      rom: '512GB',
    ),
    Product(
      name: 'iphone SE',
      image: 'assets/iphonese.png',
      price: '899',
      camera: '48MP',
      ram: '12GB',
      rom: '512GB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Iphones'),
        backgroundColor: Color.fromARGB(255, 169, 175, 181),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop iPhone',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'All models. Take Your Pick.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductTile(product: product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Prize : \$${product.price}',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Add To Cart'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
