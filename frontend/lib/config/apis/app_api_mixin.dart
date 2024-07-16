// Este mixin proporciona métodos para interactuar con el backend de app a través de la API.

import 'package:app/pages/articles/models/article.dart';
import 'package:app/config/apis/app_api.dart';

mixin AppApiMixin {

  Future<List<Article>> getArticles() async {
  final response = await AppApi.mobileGet('/api/v1/articles');

    if (response.data['doc']['data'].isEmpty) {
      return [];
    }

    final List<Article> articles = [];

    for (var item in response.data['doc']['data']) {
      articles.add(Article.fromJson(item));
    }

    return articles;

}

   
}
