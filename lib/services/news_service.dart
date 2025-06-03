import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadline({required String category}) async {
    try {
      var response = await dio.get(
        // TODO: Replace 'YOUR_API_KEY_HERE' with your actual News API key
        'https://newsapi.org/v2/top-headlines?apiKey=YOUR_API_KEY_HERE&category=$category&sortBy=publishedAt',
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
