import 'package:ecommerce_app/pages/edit.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  String _selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Settings Card
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Account'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Edit()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Change Password'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Edit()),
                    );
                  },
                ),
              ],
            ),
          ),

          // Notifications Card
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  onTap: () {
                    // Handle navigation or action for Notifications
                    // e.g., show a dialog or navigate to a different page
                  },
                ),
                SwitchListTile(
                  title: const Text('Enable Notifications'),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),

          // Theme Card
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.palette),
                  title: const Text('Theme'),
                  onTap: () {
                    // Handle navigation or action for Theme
                    // e.g., show a dialog or navigate to a different page
                  },
                ),
                ListTile(
                  title: const Text('Light Theme'),
                  leading: Radio(
                    value: 'light',
                    groupValue: _selectedTheme,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedTheme = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark Theme'),
                  leading: Radio(
                    value: 'dark',
                    groupValue: _selectedTheme,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedTheme = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Language Card
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Languages()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
