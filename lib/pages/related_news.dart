import 'package:flutter/material.dart';
import 'package:news_app/service/service.dart';
import 'package:news_app/service/service_helper.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/widget/news_list.dart';

class RelatedNews extends StatelessWidget {
  final String query;

  const RelatedNews({Key? key, required this.query}) : super(key: key);

  Future<String> getSpecificNews() async {
    final Service service = Service.specifyUrl(query);
    final String url = service.specificUrl;
    final String response = await ServiceHelper.get(url);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constant.appBarText),
        ),
        body: Column(
          children: [
            Padding(
              padding: Constant.textPadding,
              child: Text(
                query.isEmpty ? '' : 'Top News About : $query',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            NewsList(
              query: query,
              future: getSpecificNews(),
            ),
          ],
        ));
  }
}
