import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Cart.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              showOrderPopup(context);
            },
            icon: const Icon(Icons.trolley),
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('No items in cart.'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]['title']),
                  subtitle: Text('\$${cartItems[index]['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Cart.removeItem(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item removed from cart!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  void showOrderPopup(BuildContext context) async {
    bool _isLoading = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading ? const CircularProgressIndicator() : Container(),
                ],
              ),
            ),
          );
        });
      },
    );

    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 5)).then((_) {
      setState(() {
        _isLoading = false;
      });
      Cart.removeAll();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ordered successfully'),
          duration: Duration(seconds: 10),
        ),
      );
    });
    await Future.delayed(const Duration(seconds: 10));
    Navigator.of(context).pop();
  }
}

class Cart {
  static late final List<Map<String, dynamic>> _items = [];

  static List<Map<String, dynamic>> getItems() {
    return _items;
  }

  static void addItem(String title, double price) {
    _items.add({'title': title, 'price': price});
  }

  static void removeItem(int index) {
    _items.removeAt(index);
  }

  static void removeAll() {
    _items.clear();
  }

  void showOrderPopup(BuildContext context) async {
    bool _isLoading = false;
    bool _showPopup = false;
  }
}
