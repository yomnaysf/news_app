import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/latest_news_section/latest_news_list_view.dart';

class LatestNewsListViewBuilder extends StatefulWidget {
  const LatestNewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<LatestNewsListViewBuilder> createState() =>
      _LatestNewsListViewBuilderState();
}

class _LatestNewsListViewBuilderState extends State<LatestNewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadline(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LatestNewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('Oops, there was an error');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
