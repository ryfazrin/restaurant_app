import 'package:flutter/material.dart';
import 'package:restaurant_app/model/Restaurant.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const DetailRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Text(
              'Cocot e!',
              style: TextStyle(fontSize: 50.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: restaurant.menus.foods.map((food) {
                return Text(food.name);
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: restaurant.menus.drinks.map((drink) {
                return Text(drink.name);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
