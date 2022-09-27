import 'package:flutter/material.dart';
import 'package:news_app/utils/color_const.dart';
import 'package:news_app/utils/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  const SearchBar({
    Key? key,
    required this.controller,
    required this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constant.searchBarPadding,
      child: TextFormField(
        enableSuggestions: true,
        autocorrect: true,
        onEditingComplete: onEditingComplete,
        controller: controller,
        style: const TextStyle(color: ProductColor.searchBarTextColor),
        decoration: const InputDecoration(
          fillColor: ProductColor.searchBarFillColor,
          filled: true,
          hintText: Constant.hintText,
          hintStyle: TextStyle(color: ProductColor.searchBarHintColor),
          prefixIcon:
              Icon(Icons.search, color: ProductColor.searchBarTextColor),
          alignLabelWithHint: true,
          border: Constant.searchBarBorder,
          focusedBorder: Constant.searchBarBorder,
        ),
      ),
    );
  }
}
