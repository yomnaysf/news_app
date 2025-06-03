import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_news_section/category_news_list_view_builder.dart';
import 'package:news_app/widgets/latest_news_section/latest_news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Latest News',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff027FC0),
              ),
            ),
          ),
          LatestNewsListViewBuilder(category: 'general'),
          CategoryNewsListViewBuilder(category: 'general'),
        ],
      ),
    );
  }
}
