import 'package:flutter/material.dart';
import 'package:shoppy/cart.dart';

class ProductsPage extends StatelessWidget {
  final products = [
    {
      'title': 'Slippers',
      'description': 'This is the description for Product 1.',
      'price': 9.99,
      'image': 'https://i.ibb.co/rkvmnfN/equick-slippers2.jpg',
    },
    {
      'title': 'Product 2',
      'description': 'This is the description for Product 2.',
      'price': 19.99,
      'image': 'https://i.ibb.co/rkvmnfN/equick-slippers2.jpg',
    },
    {
      'title': 'Puma Trinity',
      'description': 'This is the description for Product 3.',
      'price': 49.99,
      'image': 'https://i.ibb.co/M5xSj84/png.webp',
    },
    {
      'title': 'Product 2',
      'description': 'This is the description for Product 2.',
      'price': 19.99,
      'image': 'https://i.ibb.co/rkvmnfN/equick-slippers2.jpg',
    },
    {
      'title': 'Puma Trinity',
      'description': 'This is the description for Product 3.',
      'price': 49.99,
      'image': 'https://i.ibb.co/M5xSj84/png.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      products[index]['image'] as String,
                      width: 150,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      products[index]['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(products[index]['description'] as String),
                    const SizedBox(height: 5),
                    Text(
                      '\$${products[index]['price']}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        Cart.addItem(
                          products[index]['title'] as String,
                          products[index]['price'] as double,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to cart!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
