import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utilities/helper.dart';

class AuthorDurationWidget extends StatelessWidget {
  const AuthorDurationWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;

  static const _authorTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const _timeTextStyle = TextStyle(
    color: Color(0xffFF9900),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child:
              articleModel.author != null
                  ? Row(
                    children: [
                      Icon(Icons.edit, color: Colors.grey[400]),
                      Expanded(
                        child: Text(
                          articleModel.author!,
                          style: _authorTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                  : const SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              articleModel.publishedAt != null
                  ? Text(
                    getTimeDifference(articleModel.publishedAt.toString()),
                    textAlign: TextAlign.right,
                    style: _timeTextStyle,
                  )
                  : const SizedBox(),
        ),
      ],
    );
  }
}
