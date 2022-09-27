import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class Constant {
  // --------------STRING CONSTANTS----------------
  static const String appBarText = "News App";
  static const String hintText = 'Search your interesting news';
  static const String popularNews = 'Popular News';
  static const String notFound =
      'https://www.webtekno.com/images/editor/default/0003/49/d69c8ccfa20fc2ef66b4655df8631cd433a037a3.jpeg';

  // --------------INT&DOUBLE CONSTANTS----------------
  static const double smallPicW = 150;
  static const double smallPicH = 300;

  // --------------PADDING&RADIUS CONSTANTS----------------
  static const textPadding = EdgeInsets.symmetric(vertical: 30, horizontal: 20);
  static final smallPicRadius = BorderRadius.circular(10);
  static const categoryMargin =
      EdgeInsets.symmetric(horizontal: 8, vertical: 10);
  static const searchBarPadding =
      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0);

  static const searchBarBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(
      color: Colors.black,
    ),
  );

  // --------------LIST CONSTANTS----------------

// --------------MODEL CONSTANTS----------------
  static final List<CategoryModel> categories = [
    CategoryModel(
        categoryName: 'Bussiness',
        imageUrl:
            'https://img.freepik.com/free-photo/business-concept-with-team-close-up_23-2149151159.jpg?w=1060&t=st=1664284555~exp=1664285155~hmac=d063fee408878ac761a7af37c543158c3b846537935b2d36b2c4564c1347992a'),
    CategoryModel(
        categoryName: 'Entertainment',
        imageUrl:
            'https://img.freepik.com/free-photo/metaverse-concept-collage-design_23-2149419860.jpg?w=1060&t=st=1664284591~exp=1664285191~hmac=58a68c8dd3527f333951d287faeab86147085c1bb03074c48a6dc66ec764c663'),
    CategoryModel(
        categoryName: 'Health',
        imageUrl:
            'https://img.freepik.com/free-photo/medical-banner-with-doctor-wearing-goggles_23-2149611193.jpg?w=1060&t=st=1664284616~exp=1664285216~hmac=734b286cb641bdf4f2125f464c0c8dd701bd695c96fd6d759ab5882241ac2144'),
    CategoryModel(
        categoryName: 'Science',
        imageUrl:
            'https://img.freepik.com/free-photo/scientist-researcher-doctor-with-ppe-equipment-holding-test-tubes-analyzing-blood-sample-working-vaccine-development-during-microbiology-experiment-hospital-laboratory-medicine-concept_482257-28677.jpg?w=1380&t=st=1664284637~exp=1664285237~hmac=9fe19450f4621c25c967f2c87684b7ce4101eca356cef737606f93c2d1c9a9e4'),
    CategoryModel(
        categoryName: 'Sports',
        imageUrl:
            'https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?w=1060&t=st=1664284661~exp=1664285261~hmac=e8534c35aae24d7440b68475b1a0484913d7ff5a98853488d354b8b1873c6df5'),
    CategoryModel(
        categoryName: 'Technology',
        imageUrl:
            'https://images.businessnews.com.au/images/categories/bn2020/featured-technology.jpg'),
  ];
}
