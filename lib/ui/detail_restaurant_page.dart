import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/widget/coming_soon_alert.dart';
import 'package:restaurant_app/widget/detail_sliver_appbar.dart';

class DetailRestaurantPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final String id;

  const DetailRestaurantPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
      create: (context) =>
          DetailProvider(apiService: ApiService(), id: widget.id),
      child: Scaffold(
        body: Consumer<DetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.Loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.HasData) {
              var restaurant = state.result.restaurant;
              return _buildDetail(context, restaurant);
            } else if (state.state == ResultState.NoData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.Error) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, RestaurantDetail restaurant) {
    return SafeArea(
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
                      child: Text('View All'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ComingSoonAlert();
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 3,
                  children: restaurant.menus.foods.map((food) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Card(
                            child: Center(
                              child: Text(food.name),
                            ),
                          ),
                        ),
                      ),
                    );
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
                      child: Text('View All'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ComingSoonAlert();
                          },
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 3,
                  children: restaurant.menus.drinks.map((drink) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Card(
                            child: Center(
                              child: Text(drink.name),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
