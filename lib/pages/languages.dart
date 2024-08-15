import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLanguageTile(
            context,
            'English',
            'assets/flags/usa.jpg',
            () {
              // Action for selecting English
              Navigator.pop(context);
            },
          ),
          _buildLanguageTile(
            context,
            'Arabic',
            'assets/flags/saudi.jpg',
            () {
              // Action for selecting Arabic
              Navigator.pop(context);
            },
          ),
          _buildLanguageTile(
            context,
            'German',
            'assets/flags/german.jpg',
            () {
              // Action for selecting German
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageTile(
    BuildContext context,
    String language,
    String flagPath,
    VoidCallback onTap,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: Image.asset(
        flagPath,
        width: 40,
        height: 30,
        fit: BoxFit.cover,
      ),
      title: Text(language, style: const TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }
}
