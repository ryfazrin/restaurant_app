import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListTile(
        title: Text('Scheduling Restaurant'),
        trailing: Switch.adaptive(
          value: false,
          onChanged: (value) {
            value = !value;
          },
        ),
      ),
    );
  }
}
