import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SchedulingProvider>(
      create: (_) => SchedulingProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListTile(
          title: Text('Scheduling Restaurant'),
          trailing: Consumer<SchedulingProvider>(
            builder: (context, scheduled, _) {
              return Switch.adaptive(
                value: false,
                onChanged: (value) async {
                  scheduled.scheduledRestaurant(value);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
