import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/related_news.dart';
import 'package:news_app/utils/color_const.dart';
import 'package:news_app/utils/constants.dart';

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: Constant.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RelatedNews(
                              query: Constant.categories[index].categoryName,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            Constant.categories[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: Constant.categoryMargin,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    Constant.categories[index].categoryName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: ProductColor.categoryTextColor),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
