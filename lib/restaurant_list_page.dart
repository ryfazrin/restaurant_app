import 'package:flutter/material.dart';
import 'package:restaurant_app/model/Restaurant.dart';

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

                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: ScrollPhysics(),
                  children: restaurants.map((restaurant) {
                    return Padding(
                      padding: EdgeInsets.all(6.0),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.network(
                              restaurant.pictureId,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Text(restaurant.name),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  //     (context, index) {
                  //   return _buildRestaurantItem(context, restaurants[index]);
                  // },
                );
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
