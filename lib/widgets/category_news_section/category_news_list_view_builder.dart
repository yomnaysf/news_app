import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/category_news_section/category_list.dart';
import 'package:news_app/widgets/category_news_section/category_news_list_view.dart';

class CategoryNewsListViewBuilder extends StatefulWidget {
  const CategoryNewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<CategoryNewsListViewBuilder> createState() =>
      _CategoryNewsListViewBuilderState();
}

class _CategoryNewsListViewBuilderState
    extends State<CategoryNewsListViewBuilder> {
  late Future<List<ArticleModel>> future;
  late String selectedCategory;
  static const List<String> categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];
  final dio = Dio();
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
    future = NewsService(dio).getTopHeadline(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CategoryList(
            categories: categories,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
                future =
                    future = NewsService(
                      dio,
                    ).getTopHeadline(category: category);
              });
            },
            selectedCategory: selectedCategory,
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<ArticleModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CategoryNewsListView(articles: snapshot.data!);
              } else if (snapshot.hasError) {
                return const Text('Oops, there was an error');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
