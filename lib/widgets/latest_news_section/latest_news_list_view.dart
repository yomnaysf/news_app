import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/latest_news_section/latest_news_tile.dart';

class LatestNewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const LatestNewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: articles.length <= 5 ? articles.length : 5,

        itemBuilder: (context, index) {
          return LatestNewsTile(articleModel: articles[index]);
        },
      ),
    );
  }
}
