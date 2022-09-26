import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: TextFormField(
        enableSuggestions: true,
        autocorrect: true,
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: Constant.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
