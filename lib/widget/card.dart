import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_restaurant_page.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        onTap: () {
          Navigator.pushNamed(context, DetailRestaurantPage.routeName,
              arguments: restaurant!.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: [
                  Hero(
                    tag: restaurant?.pictureId ?? "",
                    child: Image.network(
                      "https://restaurant-api.dicoding.dev/images/small/${restaurant!.pictureId}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant!.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(restaurant!.city),
                  SizedBox(height: 8.0),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List.generate(restaurant!.rating.toInt(), (index) {
                          return Icon(
                            Icons.star,
                            size: 14.0,
                            color: Colors.amber,
                          );
                        }),
                      ),
                      Text(restaurant!.rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardRestaurantSearch extends StatelessWidget {
  CardRestaurantSearch({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        onTap: () {
          Navigator.pushNamed(context, DetailRestaurantPage.routeName,
              arguments: restaurant!.id);
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: restaurant?.pictureId ?? "",
              child: Image.network(
                "https://restaurant-api.dicoding.dev/images/small/${restaurant!.pictureId}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            restaurant!.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(restaurant!.city),
          trailing: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(restaurant!.rating.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
