import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/widget/shimmer.dart';
import 'package:news_app/utils/widget/touch_area.dart';

class NewsList extends StatelessWidget {
  final String query;
  final Future<String> future;
  const NewsList({super.key, required this.query, required this.future});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: FutureBuilder<String>(
            future: future,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                final NewsModel newsModel =
                    NewsModel.fromJson(jsonDecode(snapshot.data!));
                return ListView.builder(
                  itemCount: newsModel.articles?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var article = newsModel.articles![index];
                    return TouchArea(article: article);
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Shimmer();
              }
            },
          ),
        ),
      ),
    );
  }
}
