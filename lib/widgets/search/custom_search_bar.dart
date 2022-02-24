import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  //..
  final TextEditingController _filter = TextEditingController();
  final Dio dio = Dio(); // for http requests

  String _searchText = "";
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text('Search Example');

  void _getNames() async {
    final response = await dio.get("https://swapi.co/api/people");
    List tempList = [];
    for (int i = 0; i < response.data["results"].length; i++) {
      tempList.add(response.data["results"][i]);
    }

    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

  void _searchPressed() {
    setState(() {
      if(this._searchIcon.icon == Icons.search) {}
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // controls the text label we use as a search bar
        );
  }
}
