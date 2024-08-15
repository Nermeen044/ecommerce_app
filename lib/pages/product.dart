import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0,
            left: 8.0,
            right: 8.0), // Space from the top and horizontal padding
        child: Column(
          children: [
            // Row for the first two cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: buildProductCard(
                    'assets/products/download.jpg',
                    'Cameras',
                  ),
                ),
                SizedBox(width: 8), // Space between cards
                Expanded(
                  child: buildProductCard(
                    'assets/products/laptobs.jpg',
                    'Computers',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Space between rows
            // Row for the second two cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: buildProductCard(
                    'assets/products/lights.jpg',
                    'Lights',
                  ),
                ),
                SizedBox(width: 8), // Space between cards
                Expanded(
                  child: buildProductCard(
                    'assets/products/phonessmart.jpg',
                    'Phones',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(String imageUrl, String title) {
    return Card(
      elevation: 0, // No elevation for a borderless card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // No border radius
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0), // No border radius
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150, // Adjust height as needed
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white, // Low opacity for text
                fontSize: 16,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.transparent, // No background color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
