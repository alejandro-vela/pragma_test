import 'package:flutter/material.dart';
import 'package:pragma_test/src/ui/detail_screen/detail_screen.dart';
import 'package:pragma_test/src/utils/navigation_service.dart';

import '../../bloc/cat/model/model.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<NameIndexCat> dataList;
  CustomSearchDelegate({required this.dataList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<NameIndexCat> suggestions = dataList;

    if (query.isNotEmpty) {
      suggestions = dataList
          .toList()
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(suggestions[i].name),
          onTap: () {
            NavigationService.push(
                context: context,
                screen: DetailScreen(
                  index: suggestions[i].index,
                ),
                routeName: DetailScreen.routeName);
            close(context, null);
          },
        );
      },
    );
  }
}
