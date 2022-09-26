import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    return InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(article.url!),
                        // Gonna change this later
                        // To open in app mode
                        mode: LaunchMode.inAppWebView,
                      ),
                      child: ListTile(
                        leading: article.urlToImage != null
                            ? Container(
                                height: 300,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.contain,
                                  height: 300,
                                  fadeInCurve: Curves.easeIn,
                                  imageUrl: article.urlToImage!,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                      color: Colors.deepOrange.shade700,
                                      strokeWidth: 2,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Icon(Icons.error),
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator(),
                        title: Text(article.title!),
                        subtitle: Text(article.description!),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
