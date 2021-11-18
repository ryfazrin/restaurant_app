import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites_restaurant';

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Container(
        child: Text('Body'),
      ),
    );
  }
}
