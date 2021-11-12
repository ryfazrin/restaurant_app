import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    menus = Menus.fromJson(restaurant['menus']);
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

// Menus
class Menus {
  late List<Foods> foods;
  late List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  Menus.fromJson(Map<String, dynamic> menu) {
    foods = List<Foods>.from(menu['foods'].map((x) => Foods.fromJson(x)));
    drinks = List<Drinks>.from(menu['drinks'].map((x) => Drinks.fromJson(x)));
  }
}

// Foods
class Foods {
  late String name;

  Foods({required this.name});

  Foods.fromJson(Map<String, dynamic> food) {
    name = food['name'];
  }
}

// Drinks
class Drinks {
  late String name;

  Drinks({required this.name});

  Drinks.fromJson(Map<String, dynamic> food) {
    name = food['name'];
  }
}
