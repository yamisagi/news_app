import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/constants.dart';
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
              try {
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
              } on Exception {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: Constant.smallPicRadius,
                    image: const DecorationImage(
                      image: CachedNetworkImageProvider(Constant.notFound,
                          scale: 1),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
