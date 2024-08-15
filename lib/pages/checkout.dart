import 'package:flutter/material.dart';
import 'package:ecommerce_app/pages/payment.dart'; // Import the Payment screen

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Products List
            Text(
              'Your Cart',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                      'Sony Camera', 299.99, 'assets/cards/camera.jpg'),
                  _buildCartItem(
                      'iPhone 15', 999.99, 'assets/cards/iphone.jpg'),

                  // Add more items as needed
                ],
              ),
            ),

            // Payment Details
            const SizedBox(height: 16.0),
            Text(
              'Payment Details',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildPaymentDetail('Total Amount', '\$2,099.97'),
            _buildPaymentDetail(
                'Shipping Address', '123 Main Street, City, Country'),
            _buildPaymentDetail('Payment Method', 'Credit Card'),

            // Checkout Button
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                ),
                child: const Text(
                  'Complete Purchase',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, double price, String imagePath) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(name),
        subtitle: Text('\$$price'),
      ),
    );
  }

  Widget _buildPaymentDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(detail),
        ],
      ),
    );
  }
}
