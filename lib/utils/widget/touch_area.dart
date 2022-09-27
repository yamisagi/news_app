import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/color_const.dart';
import 'package:news_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TouchArea extends StatelessWidget {
  const TouchArea({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Articles article;

  @override
  Widget build(BuildContext context) {
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
                width: Constant.smallPicW,
                height: Constant.smallPicH,
                decoration: BoxDecoration(
                  borderRadius: Constant.smallPicRadius,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        article.urlToImage ?? Constant.notFound,
                        scale: 2),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : SizedBox(
                width: Constant.smallPicW,
                height: Constant.smallPicH,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ProductColor.progressIndicatorColor,
                  ),
                )),
        title: Text(article.title ?? ''),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            article.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
