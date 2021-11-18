import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/db/database_helper.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/widget/card.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites_restaurant';

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        child: Consumer<DatabaseProvider>(builder: (context, provider, child) {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: provider.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              var restaurant = provider.favorites[index];
              return CardRestaurantSearch(restaurant: restaurant);
            },
          );
        }),
      ),
    );
  }
}
