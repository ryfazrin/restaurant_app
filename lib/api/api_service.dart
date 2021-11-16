import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<RestaurantDetailResult> foundDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/' + id));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<RestaurantSearchResult> getSearchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return RestaurantSearchResult.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to Search Restaurant');
    }
  }
}
