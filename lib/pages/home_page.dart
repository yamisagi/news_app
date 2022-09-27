import 'package:flutter/material.dart';
import 'package:news_app/pages/related_news.dart';
import 'package:news_app/service/service.dart';
import 'package:news_app/service/service_helper.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/widget/category_news.dart';
import 'package:news_app/utils/widget/news_list.dart';
import 'package:news_app/utils/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  String query = '';
  void onEditingComplete(
    BuildContext context,
  ) {
    setState(() => controller.text.isNotEmpty
        ? query = controller.text
        : query = 'Latest');
    // Dissmiss keyboard
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RelatedNews(query: query);
        },
      ),
    );
  }

  Future<String> getNews() async {
    final Service service = Service(countryName: 'us');
    final String url = service.url;
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
          SearchBar(
            onEditingComplete: (() => onEditingComplete(context)),
            controller: controller,
          ),
          const CategoryNews(),
          Padding(
            padding: Constant.textPadding,
            child: Text(
              Constant.popularNews,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          NewsList(
            query: query,
            future: getNews(),
          ),
        ],
      ),
    );
  }
}
