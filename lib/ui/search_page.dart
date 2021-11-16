import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/api/api_service.dart';
import 'package:restaurant_app/provider/search_provider.dart';
import 'package:restaurant_app/widget/card.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textFieldController = TextEditingController();
  String queries = '';
  // late Future<RestaurantSearchResult> _restaurantSearch =
  //     ApiService().getSearchRestaurant(search);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(apiService: ApiService()),
      child:
          Consumer<SearchProvider>(builder: (context, SearchProvider state, _) {
        Future<dynamic> _restaurantSearch =
            state.fetchRestaurantSearch(queries);
        // state.fetchRestaurantSearch(queries);

        return Scaffold(
          appBar: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        textFieldController.clear();
                      },
                    ),
                    hintText: 'Search Restaurant',
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    // setState(() {
                    //   queries = text;
                    // });
                    // _restaurantSearch = state.fetchRestaurantSearch(search);
                    if (text != '') {
                      state.fetchRestaurantSearch(text);
                    }
                  },
                ),
              ),
            ),
          ),
          body: _buildListView(state),
        );
      }),
    );
  }

  ListView _buildListView(SearchProvider state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: state.result.restaurants.length,
      itemBuilder: (BuildContext context, int index) {
        var restaurant = state.result.restaurants[index];
        return CardRestaurantSearch(restaurant: restaurant);
      },
    );
  }

  // Widget _buildList() {
  //   return Consumer<SearchProvider>(
  //     builder: (context, SearchProvider state, _) {
  //       if (state.state == ResultState.Loading) {
  //         // loading widget
  //         return Center(child: CircularProgressIndicator());
  //       } else if (state.state == ResultState.HasData) {
  //         return ListView.builder(
  //           shrinkWrap: true,
  //           physics: ScrollPhysics(),
  //           itemCount: state.result.restaurants.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             var restaurant = state.result.restaurants[index];
  //             return CardRestaurantSearch(restaurant: restaurant);
  //           },
  //         );
  //       } else if (state.state == ResultState.NoData) {
  //         return Center(child: Text(state.message));
  //       } else if (state.state == ResultState.Error) {
  //         return Center(child: Text(state.message));
  //       } else {
  //         return Center(child: Text(''));
  //       }
  // =========lama
  // if (snapshot.hasData) {
  //   // success widget
  // } else if (snapshot.hasError) {
  //   // error widget
  //   return Center(
  //     child: Text('Silahkan ketik restaurant yang anda cari'),
  //   );
  // } else {
  //   // loading widget
  //   return Center(child: Text('tidak ditemukan'));
  // }
  //   },
  // );

  // }Widget _buildList() {
  //   return FutureBuilder(
  //     future: _restaurantSearch,
  //     builder: (context, AsyncSnapshot<RestaurantSearchResult> snapshot) {
  //       var state = snapshot.connectionState;
  //
  //       if (state != ConnectionState.done) {
  //         // loading widget
  //         return Center(child: CircularProgressIndicator());
  //       } else {
  //         if (snapshot.hasData) {
  //           // success widget
  //           if (snapshot.data?.founded == 0) {
  //             return Center(
  //               child: Text('Restaurant tidak ditemukan :('),
  //             );
  //           } else {
  //             return ListView.builder(
  //               shrinkWrap: true,
  //               physics: ScrollPhysics(),
  //               itemCount: snapshot.data?.restaurants.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 var restaurant = snapshot.data?.restaurants[index];
  //                 return CardRestaurantSearch(restaurant: restaurant);
  //               },
  //             );
  //           }
  //         } else if (snapshot.hasError) {
  //           // error widget
  //           return Center(
  //             child: Text('Silahkan ketik restaurant yang anda cari'),
  //           );
  //         } else {
  //           // loading widget
  //           return Center(child: Text('tidak ditemukan'));
  //         }
  //       }
  //     },
  //   );
  // }
}
