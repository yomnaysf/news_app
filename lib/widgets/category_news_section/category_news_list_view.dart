import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/category_news_section/category_news_tile.dart';

class CategoryNewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const CategoryNewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: articles.length,

        itemBuilder: (context, index) {
          return CategoryNewsTile(articleModel: articles[index]);
        },
      ),
    );
  }
}
