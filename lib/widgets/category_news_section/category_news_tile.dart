import 'package:flutter/material.dart';
import 'package:news_app/base_layout.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_view.dart';
import 'package:news_app/widgets/author_duration_widget.dart';
import 'package:news_app/common_widgets/build_news_image.dart';

class CategoryNewsTile extends StatelessWidget {
  const CategoryNewsTile({super.key, required this.articleModel});
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
        padding: const EdgeInsets.only(right: 15, bottom: 15),
        child: Row(
          children: [
            BuildNewsImage(
              articleModel: articleModel,
              height: 140,
              width: 140,
              topRadius: 12,
              bottomRadius: 12,
            ),
            Expanded(
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 10,
                    bottom: 15,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
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
                      const Spacer(),
                      AuthorDurationWidget(articleModel: articleModel),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
