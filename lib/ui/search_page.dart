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
  String queries = ' ';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Consumer<SearchProvider>(
                builder: (context, SearchProvider state, _) {
              return Center(
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
                    setState(() {
                      queries = text;
                    });
                    // _restaurantSearch = state.fetchRestaurantSearch(search);
                    if (text != '') {
                      state.fetchRestaurantSearch(query: text);
                    }
                  },
                ),
              );
            }),
          ),
        ),
        body: Consumer<SearchProvider>(
            builder: (context, SearchProvider state, _) {
          if (state.state == ResultState.Loading) {
            // loading widget
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: state.result.restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                var restaurant = state.result.restaurants[index];
                return CardRestaurantSearch(restaurant: restaurant);
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message + ' noData'));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text(state.message + ' Error'));
          } else {
            return Center(child: Text(''));
          }
        }),
      ),
    );
  }
}
