import 'package:ecommerce_app/pages/checkout.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample list of products in the cart
  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/cards/camera.jpg',
      'name': 'Sony Camera',
      'price': '\$999',
      'id': '1'
    },
    {
      'image': 'assets/cards/iphone.jpg',
      'name': 'iPhone 15',
      'price': '\$1199',
      'id': '2'
    },
    // Add more products if needed
  ];

  void _removeItem(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05; // 5% padding of screen width

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            // List of cart items
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: padding / 2),
                    child: ListTile(
                      leading: Image.asset(
                        product['image'],
                        width: screenWidth * 0.15, // 15% of screen width
                        height: screenWidth * 0.15, // 15% of screen width
                        fit: BoxFit.cover,
                      ),
                      title: Text(product['name']),
                      subtitle: Text(product['price']),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Payment details and checkout button
            Padding(
              padding: EdgeInsets.only(top: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // 5% of screen width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(padding / 2),
                      ),
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(padding / 2),
                      ),
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(padding / 2),
                      ),
                    ),
                  ),
                  SizedBox(height: padding),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.04, // 4% of screen width
                          horizontal: screenWidth * 0.1, // 10% of screen width
                        ),
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
