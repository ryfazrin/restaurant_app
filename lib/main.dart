import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_restaurant_page.dart';
import 'package:restaurant_app/model/Restaurant.dart';
import 'package:restaurant_app/restaurant_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => RestaurantListPage(),
        DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
