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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            elevation: 0.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16.0),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(dataRestaurant.name),
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
        ];
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 6.0),
                  Text(
                    dataRestaurant.city,
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
                      dataRestaurant.rating.toInt(),
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
                  Text(dataRestaurant.rating.toString()),
                ],
              ),
              SizedBox(height: 18.0),
              Text(
                'About ${dataRestaurant.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                dataRestaurant.description,
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
              SizedBox(height: 18.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dataRestaurant.menus.foods.map((food) {
                  return Card(child: Text(food.name));
                }).toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dataRestaurant.menus.drinks.map((drink) {
                  return Card(child: Text(drink.name));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
