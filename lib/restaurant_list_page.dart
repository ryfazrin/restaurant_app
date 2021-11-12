import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant_app/model/Restaurant.dart';

import 'detail_restaurant_page.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Pick Your Favorite Restaurant',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            FutureBuilder<dynamic>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                final List<Restaurant> restaurants =
                    parseRestaurants(snapshot.data);

                return StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: ScrollPhysics(),
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                    itemCount: restaurants.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Restaurant restaurant = restaurants[index];

                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          onTap: () {
                            Navigator.pushNamed(
                                context, DetailRestaurantPage.routeName,
                                arguments: restaurant);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  restaurant.pictureId,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(restaurant.city),
                                    SizedBox(height: 8.0),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              restaurant.rating.toInt(),
                                              (index) {
                                            return Icon(
                                              Icons.star,
                                              size: 14.0,
                                              color: Colors.amber,
                                            );
                                          }),
                                        ),
                                        Text(restaurant.rating.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  //   return InkWell(
  //     child: ListView(
  //       children: [
  //         Stack(
  //           children: [
  //             Container(
  //               height: MediaQuery.of(context).size.height / 3.6,
  //               width: MediaQuery.of(context).size.width / 2.2,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(8.0),
  //                 child: Image.network(
  //                   restaurant.pictureId,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               right: -10.0,
  //               bottom: 3.0,
  //               child: RawMaterialButton(
  //                 onPressed: () {},
  //                 fillColor: Colors.white,
  //                 shape: CircleBorder(),
  //                 elevation: 4.0,
  //                 child: Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: Icon(
  //                     Icons.favorite_border,
  //                     color: Colors.red,
  //                     size: 17,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //     onTap: () {},
  //   );
  // }
}

// Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
//   return ListTile(
//     isThreeLine: true,
//     leading: Image.network(
//       restaurant.pictureId,
//       width: 100,
//     ),
//     title: Text(restaurant.name),
//     subtitle: Text(restaurant.city),
//     // subtitle: Text(restaurant.menus.foods.map((e) => e.name).toString()),
//     trailing: Text(restaurant.rating.toString()),
//     onTap: () {
//       Navigator.pushNamed(context, DetailRestaurantPage.routeName,
//           arguments: restaurant);
//     },
//   );
// }
