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
      // appBar: AppBar(
      //   title: Text(restaurant.name),
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        child: DetailSliverAppBar(
          dataRestaurant: restaurant,
        ),
        // child: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       // Stack(children: [
        //       //   Image.network(restaurant.pictureId),
        //       // ]),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: restaurant.menus.foods.map((food) {
        //           return Text(food.name);
        //         }).toList(),
        //       ),
        //       SizedBox(height: 16.0),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: restaurant.menus.drinks.map((drink) {
        //           return Text(drink.name);
        //         }).toList(),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class DetailSliverAppBar extends StatelessWidget {
  final Restaurant dataRestaurant;

  const DetailSliverAppBar({Key? key, required this.dataRestaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 300.0,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(dataRestaurant.name),
            centerTitle: true,
            background: Image.network(
              dataRestaurant.pictureId,
              fit: BoxFit.fill,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text('Hello'),
          ),
        ),
      ],
    );
  }
}
