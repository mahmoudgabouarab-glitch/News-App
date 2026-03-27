import 'package:flutter/material.dart';
import 'package:news_app/core/utils/styles.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
          child: ListTile(
            leading: Image.network(
              "https://img.freepik.com/free-vector/global-broadcast-breaking-news-banner-with-global-map_1017-59836.jpg?semt=ais_hybrid&w=740&q=80",
              fit: BoxFit.cover,
            ),
            title: Text(
              "bookModels.volumeInfo?.title",
              style: Styles.s16_500,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "bookModels.volumeInfo?.authors?[0]",
              style: Styles.s15_400.copyWith(color: Colors.grey[600]),
            ),
            trailing: IconButton(
              onPressed: () async {},
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
    );
  }
}
