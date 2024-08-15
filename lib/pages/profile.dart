import 'package:ecommerce_app/pages/CartPage.dart';
import 'package:ecommerce_app/pages/edit.dart';
import 'package:ecommerce_app/pages/settings.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // Circular image at the top
          Container(
            margin: EdgeInsets.symmetric(
                vertical: screenWidth * 0.05), // Responsive margin
            child: CircleAvatar(
              radius: screenWidth * 0.2, // Responsive size
              backgroundImage: AssetImage(
                  'assets/products/OIP.jpg'), // Replace with your image asset
            ),
          ),
          // ListView for profile options
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  context,
                  'My Account',
                  Icons.account_circle,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Edit()),
                    );
                  },
                ),
                _buildListTile(
                  context,
                  'My Orders',
                  Icons.shopping_cart,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
                _buildListTile(
                  context,
                  'Languages',
                  Icons.language,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Languages()), // Replace with your Language screen
                    );
                  },
                ),
                _buildListTile(
                  context,
                  'Settings',
                  Icons.settings,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Settings()), // Replace with your Settings screen
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 5, // Elevation for the card
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios), // Arrow icon
        onTap: onTap,
      ),
    );
  }
}
