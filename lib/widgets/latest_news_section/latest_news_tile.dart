import 'package:flutter/material.dart';
import 'package:news_app/base_layout.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_view.dart';
import 'package:news_app/widgets/author_duration_widget.dart';
import 'package:news_app/common_widgets/build_news_image.dart';

class LatestNewsTile extends StatelessWidget {
  const LatestNewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BaseLayout(body: NewsView(articleItem: articleModel));
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          width: 303,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildNewsImage(
                articleModel: articleModel,
                height: 150,
                width: 280,
                topRadius: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  articleModel.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AuthorDurationWidget(articleModel: articleModel),
            ],
          ),
        ),
      ),
    );
  }
}
