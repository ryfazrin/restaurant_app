import 'package:flutter/material.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    fetchRestaurantSearch(query: ' ');
  }

  late RestaurantSearchResult _restaurantSearchResult;
  late ResultState _state;

  String _query = '';

  String get query => _query;

  String _message = '';

  String get message => _message;

  RestaurantSearchResult get result => _restaurantSearchResult;

  ResultState get state => _state;

  Future<dynamic> fetchRestaurantSearch({String query = ''}) async {
    try {
      _state = ResultState.Loading;
      _query = query;

      final restaurantSearch = await apiService.getSearchRestaurant(query);

      if (restaurantSearch.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Data Tidak Ditemukan';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantSearchResult = restaurantSearch;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Sepertinya ada Masalah dengan jaringan anda :(';
    }
  }
}
