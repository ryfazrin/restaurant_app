import 'package:flutter/material.dart';
import 'package:restaurant_app/model/Restaurant.dart';
import 'package:restaurant_app/widget/detail_sliver_appbar.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const DetailRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool isScrolled) {
            return [
              DetailSliverAppBar(restaurant: restaurant),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 6.0),
                      Text(
                        restaurant.city,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          restaurant.rating.toInt(),
                          (index) {
                            return Icon(
                              Icons.star,
                              size: 20.0,
                              color: Colors.amber,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(restaurant.rating.toString()),
                    ],
                  ),
                  SizedBox(height: 18.0),
                  Text(
                    'About ${restaurant.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Foods',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All'),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 3,
                    children: restaurant.menus.foods.map((food) {
                      return Card(child: Center(child: Text(food.name)));
                    }).toList(),
                  ),
                  SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Drinks',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All'),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 3,
                    children: restaurant.menus.drinks.map((drink) {
                      return Card(child: Center(child: Text(drink.name)));
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
