import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailProvider extends ChangeNotifier {
  late final ApiService apiService;
  late final String id;

  DetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  late RestaurantDetailResult _restaurantDetailResult;
  late ResultState _state;

  String _message = '';

  String get message => _message;

  RestaurantDetailResult get result => _restaurantDetailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.foundDetail(id);
      if (restaurantDetail.error == true) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetailResult = restaurantDetail;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      // return _message = 'Error kan -> $e';
      return _message = 'Sepertinya ada Masalah dengan jaringan anda :(';
    }
  }
}
