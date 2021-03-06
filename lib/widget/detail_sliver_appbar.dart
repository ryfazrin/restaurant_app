import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';

class DetailSliverAppBar extends StatelessWidget {
  const DetailSliverAppBar({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300.0,
      elevation: 0.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.0),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(restaurant.name),
        background: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
            fit: BoxFit.fill,
          ),
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
    );
  }
}
