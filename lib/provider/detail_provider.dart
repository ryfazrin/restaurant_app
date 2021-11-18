import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class DetailProvider extends ChangeNotifier {
  late final ApiService apiService;

  DetailProvider({required this.apiService}) {
    _fetchRestaurantDetail();
  }

  late RestaurantDetailResult _restaurantDetailResult;
  late ResultState _state;

  String _id = '';
  String _message = '';

  String get message => _message;

  RestaurantDetailResult get result => _restaurantDetailResult;

  ResultState get state => _state;

  void set setId(String id) {
    _id = id;
    notifyListeners();
  }

  Future<dynamic> _fetchRestaurantDetail() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.foundDetail(_id);
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
      print("cek lagi: ${_id}");
      return _message = 'Error kan -> $e';
      // return _message = 'Sepertinya ada Masalah dengan jaringan anda :(';
    }
  }
}
