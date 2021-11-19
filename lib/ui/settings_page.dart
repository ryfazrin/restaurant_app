import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/preferences/preferences_helper.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PreferencesProvider>(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
        ),
      ],
      child: Consumer<PreferencesProvider>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ),
          body: ListTile(
            title: Text('Scheduling Restaurant'),
            trailing: Consumer<SchedulingProvider>(
              builder: (context, scheduled, _) {
                return Switch.adaptive(
                  value: provider.isDailyRestaurantsActive,
                  onChanged: (value) async {
                    scheduled.scheduledRestaurant(value);
                    provider.enableDailyRestaurants(value);
                  },
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
