import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class BuildNewsImage extends StatelessWidget {
  const BuildNewsImage({
    super.key,
    required this.articleModel,
    required this.height,
    required this.width,
    this.topRadius,
    this.bottomRadius,
  });

  final ArticleModel articleModel;
  final double height;
  final double width;
  final double? topRadius;
  final double? bottomRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(topRadius ?? 0),
        bottom: Radius.circular(bottomRadius ?? 0),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child:
            articleModel.image != null
                ? Image.network(
                  articleModel.image!,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Image.asset('assets/news_default_image.png'),
                )
                : Image.asset('assets/news_default_image.png'),
      ),
    );
  }
}
