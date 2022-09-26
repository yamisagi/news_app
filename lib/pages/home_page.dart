import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constant.appBarText),
      ),
    );
  }
}
