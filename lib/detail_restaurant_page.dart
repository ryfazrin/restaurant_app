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
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Image.network(restaurant.pictureId),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Card(
                //       margin: EdgeInsets.all(0),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           IconButton(
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             icon: Icon(Icons.arrow_back),
                //           ),
                //         ],
                //       ),
                //       shape: BeveledRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //           bottomRight: Radius.circular(16.0),
                //         ),
                //       ),
                //     ),
                //     Card(
                //       margin: EdgeInsets.all(0),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(right: 16.0),
                //             child: Text(
                //               restaurant.name,
                //               style: Theme.of(context).textTheme.headline6,
                //             ),
                //           ),
                //           IconButton(
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             icon: Icon(Icons.star),
                //           ),
                //         ],
                //       ),
                //       shape: BeveledRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //           bottomRight: Radius.circular(16.0),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ]),
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
      ),
    );
  }
}
