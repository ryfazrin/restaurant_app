import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/widget/card.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantResult> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant App',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Pick Your Favorite Restaurant',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: _restaurant,
      builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
        var state = snapshot.connectionState;

        if (state != ConnectionState.done) {
          // loading widget
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            // success widget
            return StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: ScrollPhysics(),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                var restaurant = snapshot.data?.restaurants[index];
                return CardRestaurant(restaurant: restaurant);
              },
            );
          } else if (snapshot.hasError) {
            // error widget
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            // loading widget
            return Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }
}

// class CardRestaurant extends StatelessWidget {
//   const CardRestaurant({
//     Key? key,
//     required this.restaurant,
//   }) : super(key: key);
//
//   final Restaurant? restaurant;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: InkWell(
//         borderRadius: BorderRadius.all(Radius.circular(6.0)),
//         onTap: () {
//           Navigator.pushNamed(context, DetailRestaurantPage.routeName,
//               arguments: restaurant);
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 "https://restaurant-api.dicoding.dev/images/small/${restaurant!.pictureId}",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     restaurant!.name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(restaurant!.city),
//                   SizedBox(height: 8.0),
//                   Wrap(
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children:
//                             List.generate(restaurant!.rating.toInt(), (index) {
//                           return Icon(
//                             Icons.star,
//                             size: 14.0,
//                             color: Colors.amber,
//                           );
//                         }),
//                       ),
//                       Text(restaurant!.rating.toString()),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
