import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final searchResults;
  // print(searchResults);

  SearchResultPage({required this.searchResults});
  // print(searchResults);

  @override
  Widget build(BuildContext context) {
    print(
        'ini adalah hasil search result pada halaman search tampilan = $searchResults');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
      ),
      // body: ListView.builder(
      //   // itemCount: searchResults.length,
      //   // itemBuilder: (context, index) {
      //   //   return SearchResultItemWidget(searchResult: searchResults[index]);
      // },
      // ),
    );
  }
}

class SearchResultItem {
  final String storeName;
  final double price;

  SearchResultItem({required this.storeName, required this.price});
}

class SearchResultItemWidget extends StatelessWidget {
  final SearchResultItem searchResult;

  SearchResultItemWidget({required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('searchResult.storeName'),
        subtitle: Text("Price: \${searchResult.price.toStringAsFixed(2)}"),
      ),
    );
  }
}
