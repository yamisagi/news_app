import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  String query = '';
  void onEditingComplete(BuildContext context) {
    setState(() => query = controller.text);
    // Dissmiss keyboard
    FocusScope.of(context).unfocus();
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
            // For debugging
            Text('Search: $query'),
          ],
        ));
  }
}
