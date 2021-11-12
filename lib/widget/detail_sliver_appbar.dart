import 'package:flutter/material.dart';
import 'package:restaurant_app/model/Restaurant.dart';

class DetailSliverAppBar extends StatelessWidget {
  const DetailSliverAppBar({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

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
        background: Image.network(
          restaurant.pictureId,
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
    );
  }
}
