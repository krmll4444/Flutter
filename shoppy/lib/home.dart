import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppy/main.dart';

final List<String> imageUrls = [
  'https://sneakerstudio.com.ua/ukr_pm_KROSIVKI-adidas-Originals-Ozelia-J-HQ1607-1054737_1.jpg',
  'https://sneakerstudio.com.ua/ukr_pm_KROSIVKI-adidas-Originals-Ozelia-J-GW8130-1044216_1.jpg',
  'https://sneakerstudio.com.ua/ukr_pm_KROSIVKI-adidas-Originals-Ozelia-J-GW8114-1036884_1.jpg',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String userEmail = currentUser?.email ?? 'Unknown';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoppy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              if (userEmail != 'Unknown') {
                Navigator.pushNamed(context, '/me');
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              if (userEmail != 'Please Sign In/Log In to make orders') {
                Navigator.pushNamed(context, '/cart');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Column(children: [
                Image.network(
                  'https://i.ibb.co/w0ychM6/Shoeaholics-Discounted-Shoes.jpg',
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.width) * 0.5,
                  fit: BoxFit.cover,
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CarouselSlider(
                items: imageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    width: (MediaQuery.of(context).size.width) * 2,
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/products');
        },
        tooltip: 'Products',
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
